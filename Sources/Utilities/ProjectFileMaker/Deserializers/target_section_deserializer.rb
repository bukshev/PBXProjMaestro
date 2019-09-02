# frozen_string_literal: true

# MIT License
#
# Copyright (c) 2019 Ivan Bukshev
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

require_relative '../../../Common/environment'
require_relative '../../../Common/pbxproj_regexps'
require_relative '../../../Model/ProjectFile/Elements/Target/Subelements/pbx_native_target'
require_relative '../../../../Sources/Model/ProjectFile/Elements/Target/pbx_target'

class TargetSectionDeserializer
  # @return [PBXTarget]
  def self.entity(lines)
    PBXTarget.new(aggregate_target(lines),
                  legacy_target(lines),
                  native_target(lines))
  end

  def self.aggregate_target(_lines)
    nil
  end

  def self.legacy_target(_lines)
    nil
  end

  def self.native_target(lines)
    native_targets = []

    value_extractor = SafeValueExtractor.new
    section_lines = SectionHighlighter.section_lines(lines, PBXSectionName::PBXNativeTarget)
    regexp = Regexp.new(PBXRegexp::SINGLE_ELEMENT_SUBSECTION, Regexp::IGNORECASE)

    section_lines.scan(regexp).each do |match|
      reference = match[0].delete("\r\t\n ")

      reference_comment = match[1].delete("\r\t\n")

      subsection = match[2]

      isa = value_extractor.value(subsection,
                                  PBXRegexp::ISA,
                                  DefaultValue::STRING)

      build_configuration_list = value_extractor.value(subsection,
                                                       PBXRegexp::BUILD_CONFIGURATION_LIST,
                                                       DefaultValue::STRING)

      build_phases = []
      build_phases_lines = value_extractor.value(subsection,
                                                 PBXRegexp::BUILD_PHASES,
                                                 DefaultValue::ARRAY)
      build_phases_lines.scan(Regexp.new(PBXRegexp::TARGET_LIST_FILE, Regexp::IGNORECASE)) do |match|
        phase_reference = match[0].delete("\r\t\n ")
        phase_reference_comment = match[1]
        # TODO: Create default value for optional method parameter.
        build_phases.push ListFileReference.new(phase_reference,
                                                phase_reference_comment,
                                                nil)
      end

      # TODO: Implement this part of native target.
      build_rules = []

      dependencies = []
      dependencies_lines = value_extractor.value(subsection,
                                                 PBXRegexp::DEPENDENCIES,
                                                 DefaultValue::ARRAY)
      dependencies_lines.scan(Regexp.new(PBXRegexp::TARGET_LIST_FILE, Regexp::IGNORECASE)) do |match|
        dependency_reference = match[0].delete("\r\t\n ")
        dependency_reference_comment = match[1]
        # TODO: Create default value for optional method parameter.
        dependencies.push ListFileReference.new(dependency_reference,
                                                dependency_reference_comment,
                                                nil)
      end

      name = value_extractor.value(subsection,
                                   PBXRegexp::NAME,
                                   DefaultValue::STRING)

      product_name = value_extractor.value(subsection,
                                           PBXRegexp::PRODUCT_NAME,
                                           DefaultValue::STRING)

      product_reference = value_extractor.value(subsection,
                                                PBXRegexp::PRODUCT_REFERENCE,
                                                DefaultValue::STRING)

      product_type = value_extractor.value(subsection,
                                           PBXRegexp::PRODUCT_TYPE,
                                           DefaultValue::STRING)

      native_targets.push PBXNativeTarget.new(reference,
                                              reference_comment,
                                              isa,
                                              build_configuration_list,
                                              build_phases,
                                              build_rules,
                                              dependencies,
                                              name,
                                              nil,
                                              product_name,
                                              product_reference,
                                              product_type)
    end

    native_targets
  end
end
