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

require_relative '../../../../Sources/Model/ProjectFile/Elements/FileElement/Subelements/pbx_file_reference'
require_relative '../../../Model/ProjectFile/Elements/FileElement/pbx_file_element'
require_relative '../../../../Sources/Utilities/ProjectFileMaker/Common/safe_value_extractor'
require_relative '../../../../Sources/Common/pbxproj_section_names'
require_relative '../../../../Sources/Common/default_values'
require_relative '../../../../Sources/Model/ProjectFile/Elements/FileElement/Subelements/pbx_group'
require_relative '../../../../Sources/Model/ProjectFile/Elements/FileElement/Subelements/pbx_variant_group'

class FileElementSectionDeserializer
  # @return [PBXFileElement]
  def self.entity(lines)
    PBXFileElement.new(file_references(lines),
                       groups(lines),
                       variant_groups(lines))
  end

  def self.file_references(lines)
    file_references = []
    value_extractor = SafeValueExtractor.new

    section_lines = SectionHighlighter.section_lines(lines, PBXSectionName::PBXFileReference)
    regexp = Regexp.new(PBXRegexp::SINGLE_ELEMENT_INLINE_SUBSECTION, Regexp::IGNORECASE)

    section_lines.scan(regexp).each do |match|
      reference = match[0].delete("\r\t\n ")

      reference_comment = match[1].delete("\r\t\n")

      subsection = match[2]

      isa = value_extractor.value(subsection,
                                  PBXRegexp::ISA,
                                  DefaultValue::STRING)

      explicit_file_type = value_extractor.value(subsection,
                                                 PBXRegexp::EXPLICIT_FILE_TYPE,
                                                 DefaultValue::STRING)

      last_known_file_type = value_extractor.value(subsection,
                                                   PBXRegexp::LAST_KNOWN_FILE_TYPE,
                                                   DefaultValue::STRING)

      name = value_extractor.value(subsection,
                                   PBXRegexp::NAME,
                                   DefaultValue::STRING)

      path = value_extractor.value(subsection,
                                   PBXRegexp::PATH,
                                   DefaultValue::STRING)

      source_tree = value_extractor.value(subsection,
                                          PBXRegexp::SOURCE_TREE,
                                          DefaultValue::STRING)

      file_references.push PBXFileReference.new(reference,
                                                reference_comment,
                                                isa,
                                                nil,
                                                explicit_file_type,
                                                last_known_file_type,
                                                name,
                                                path,
                                                source_tree)
    end

    file_references
  end

  def self.groups(lines)
    groups = []
    value_extractor = SafeValueExtractor.new

    section_lines = SectionHighlighter.section_lines(lines, PBXSectionName::PBXGroup)
    regexp = Regexp.new(PBXRegexp::SINGLE_ELEMENT_SUBSECTION,
                        Regexp::IGNORECASE)

    section_lines.scan(regexp).each do |match|
      reference = match[0].delete("\r\t\n ")

      reference_comment = match[1].delete("\r\t\n")

      subsection = match[2]

      isa = value_extractor.value(subsection,
                                  PBXRegexp::ISA,
                                  DefaultValue::STRING)

      children = []
      children_lines = value_extractor.value(subsection,
                                             PBXRegexp::CHILDREN_LIST,
                                             DefaultValue::ARRAY)
      children_lines.scan(Regexp.new(PBXRegexp::CHILDREN_LIST_FILE, Regexp::IGNORECASE)) { |match|
        children_reference = match[0].delete("\r\t\n ")
        children_reference_comment = match[1]
        children.push ListFileReference.new(children_reference,
                                            children_reference_comment,
                                            nil)
      }

      name = value_extractor.value(subsection,
                                   PBXRegexp::NAME,
                                   DefaultValue::STRING)

      source_tree = value_extractor.value(subsection,
                                          PBXRegexp::SOURCE_TREE,
                                          DefaultValue::STRING)

      groups.push PBXGroup.new(reference,
                               reference_comment,
                               isa,
                               children,
                               name,
                               source_tree)
    end

    groups
  end

  def self.variant_groups(lines)
    groups = []
    value_extractor = SafeValueExtractor.new

    section_lines = SectionHighlighter.section_lines(lines, PBXSectionName::PBXVariantGroup)
    regexp = Regexp.new(PBXRegexp::SINGLE_ELEMENT_SUBSECTION, Regexp::IGNORECASE)

    section_lines.scan(regexp).each do |match|
      reference = match[0].delete("\r\t\n ")

      reference_comment = match[1].delete("\r\t\n")

      subsection = match[2]

      isa = value_extractor.value(subsection,
                                  PBXRegexp::ISA,
                                  DefaultValue::STRING)

      children = []

      children_lines = value_extractor.value(subsection,
                                             PBXRegexp::CHILDREN_LIST,
                                             DefaultValue::ARRAY)
      children_lines.scan(Regexp.new(PBXRegexp::CHILDREN_LIST_FILE, Regexp::IGNORECASE)) { |match|
        children_reference = match[0].delete("\r\t\n ")
        children_reference_comment = match[1]
        children.push ListFileReference.new(children_reference,
                                            children_reference_comment,
                                            nil)
      }

      name = value_extractor.value(subsection,
                                   PBXRegexp::NAME,
                                   DefaultValue::STRING)

      source_tree = value_extractor.value(subsection,
                                          PBXRegexp::SOURCE_TREE,
                                          DefaultValue::STRING)

      groups.push PBXVariantGroup.new(reference,
                                      reference_comment,
                                      isa,
                                      children,
                                      name,
                                      source_tree)
    end

    groups
  end

  private_class_method :file_references,
                       :groups,
                       :variant_groups
end