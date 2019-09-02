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

require_relative '../../../Model/ProjectFile/Elements/BuildPhase/Subelements/pbx_apple_script_build_phase'
require_relative '../../../Model/ProjectFile/Elements/BuildPhase/Subelements/pbx_copy_files_build_phase'
require_relative '../../../Model/ProjectFile/Elements/BuildPhase/Subelements/pbx_frameworks_build_phase'
require_relative '../../../Model/ProjectFile/Elements/BuildPhase/Subelements/pbx_headers_build_phase'
require_relative '../../../Model/ProjectFile/Elements/BuildPhase/Subelements/pbx_resources_build_phase'
require_relative '../../../Model/ProjectFile/Elements/BuildPhase/Subelements/pbx_shell_script_build_phase'
require_relative '../../../Model/ProjectFile/Elements/BuildPhase/Subelements/pbx_sources_build_phase'
require_relative '../../../../Sources/Utilities/ProjectFileMaker/Common/safe_value_extractor'
require_relative '../../../Model/ProjectFile/Elements/BuildPhase/pbx_build_phase'
require_relative '../../../../Sources/Utilities/ProjectFileMaker/Common/section_highlighter'
require_relative '../../../../Sources/Common/pbxproj_regexps'
require_relative '../../../../Sources/Model/ProjectFile/Elements/Common/list_file_reference'

class BuildPhaseSectionDeserializer
  # @return [PBXBuildPhase]
  def self.entity(lines)
    PBXBuildPhase.new(apple_scripts(lines),
                      copy_files(lines),
                      frameworks(lines),
                      headers(lines),
                      resources_phase(lines),
                      shell_scripts(lines),
                      sources(lines))
  end

  # @return [PBXAppleScriptBuildPhase]
  def self.apple_scripts(_lines)
    # TODO: Temporary unavailable. Try to add apple script to pbxproj.
    # TODO: Use nil-object pattern for cases like this?
    nil
  end

  # @return [PBXCopyFilesBuildPhase]
  def self.copy_files(lines)
    copy_files = []

    value_extractor = SafeValueExtractor.new
    section_lines = SectionHighlighter.section_lines(lines, PBXSectionName::PBXCopyFilesBuildPhase)
    regexp = Regexp.new(PBXRegexp::SINGLE_ELEMENT_SUBSECTION, Regexp::IGNORECASE)

    section_lines.scan(regexp).each do |match|
      reference = match[0].delete("\r\t\n ")
      reference_comment = match[1].delete("\r\t\n")

      subsection = match[2]

      isa = value_extractor.value(subsection,
                                  PBXRegexp::ISA,
                                  DefaultValue::STRING)

      build_action_mask = value_extractor.value(subsection,
                                                PBXRegexp::BUILD_ACTION_MASK,
                                                -1)

      dst_path = value_extractor.value(subsection,
                                       PBXRegexp::DST_PATH,
                                       DefaultValue::STRING)

      dst_subfolder_spec = value_extractor.value(subsection,
                                                 PBXRegexp::DST_SUBFOLDER_SPEC,
                                                 DefaultValue::STRING)

      files = []
      files_lines = value_extractor.value(subsection,
                                          PBXRegexp::FILES_LIST,
                                          DefaultValue::STRING)
      files_lines.scan(Regexp.new(PBXRegexp::LIST_FILE_REFERENCE, Regexp::IGNORECASE)) { |match|
        file_reference = match[0].delete("\r\t\n ")
        file_reference_comment = match[1]
        file_location = match[2]
        files.push ListFileReference.new(file_reference,
                                         file_reference_comment,
                                         file_location)
      }

      name = value_extractor.value(subsection,
                                   PBXRegexp::NAME,
                                   DefaultValue::STRING)

      run_only_for_deployment_postprocessing = value_extractor.value(subsection,
                                                                     PBXRegexp::RUN_ONLY_FOR_DEPLOYMENT_POSTPROCESSING,
                                                                     0)

      copy_files.push PBXCopyFilesBuildPhase.new(reference,
                                                 reference_comment,
                                                 isa,
                                                 build_action_mask,
                                                 dst_path,
                                                 dst_subfolder_spec,
                                                 files,
                                                 name,
                                                 run_only_for_deployment_postprocessing)
    end

    copy_files
  end

  # @return [PBXBuildPhase]
  def self.frameworks(lines)
    frameworks = []
    value_extractor = SafeValueExtractor.new

    section_lines = SectionHighlighter.section_lines(lines, PBXSectionName::PBXFrameworksBuildPhase)
    regexp = Regexp.new(PBXRegexp::SINGLE_ELEMENT_SUBSECTION, Regexp::IGNORECASE)

    section_lines.scan(regexp).each do |match|
      reference = match[0].delete("\r\t\n ")
      reference_comment = match[1].delete("\r\t\n")

      subsection = match[2]

      isa = value_extractor.value(subsection,
                                  PBXRegexp::ISA,
                                  DefaultValue::STRING)

      build_action_mask = value_extractor.value(subsection,
                                                PBXRegexp::BUILD_ACTION_MASK,
                                                -1)

      files = []
      files_lines = value_extractor.value(subsection,
                                          PBXRegexp::FILES_LIST,
                                          DefaultValue::STRING)
      files_lines.scan(Regexp.new(PBXRegexp::LIST_FILE_REFERENCE, Regexp::IGNORECASE)) { |match|
        file_reference = match[0].delete("\r\t\n ")
        file_reference_comment = match[1]
        file_location = match[2]
        files.push ListFileReference.new(file_reference,
                                         file_reference_comment,
                                         file_location)
      }

      run_only_for_deployment_postprocessing = value_extractor.value(subsection,
                                                                     PBXRegexp::RUN_ONLY_FOR_DEPLOYMENT_POSTPROCESSING,
                                                                     0)

      frameworks.push PBXFrameworksBuildPhase.new(reference,
                                                  reference_comment,
                                                  isa,
                                                  build_action_mask,
                                                  files,
                                                  run_only_for_deployment_postprocessing)
    end

    frameworks
  end

  # @return [PBXBuildPhase]
  def self.headers(lines)
    headers = []
    value_extractor = SafeValueExtractor.new

    section_lines = SectionHighlighter.section_lines(lines, PBXSectionName::PBXHeadersBuildPhase)
    regexp = Regexp.new(PBXRegexp::SINGLE_ELEMENT_SUBSECTION, Regexp::IGNORECASE)

    section_lines.scan(regexp).each do |match|
      reference = match[0].delete("\r\t\n ")
      reference_comment = match[1].delete("\r\t\n")

      subsection = match[2]

      isa = value_extractor.value(subsection,
                                  PBXRegexp::ISA,
                                  DefaultValue::STRING)

      build_action_mask = value_extractor.value(subsection,
                                                PBXRegexp::BUILD_ACTION_MASK,
                                                -1)

      files = []
      files_lines = value_extractor.value(subsection,
                                          PBXRegexp::FILES_LIST,
                                          DefaultValue::STRING)
      files_lines.scan(Regexp.new(PBXRegexp::LIST_FILE_REFERENCE, Regexp::IGNORECASE)) { |match|
        file_reference = match[0].delete("\r\t\n ")
        file_reference_comment = match[1]
        file_location = match[2]
        files.push ListFileReference.new(file_reference,
                                         file_reference_comment,
                                         file_location)
      }

      run_only_for_deployment_postprocessing = value_extractor.value(subsection,
                                                                     PBXRegexp::RUN_ONLY_FOR_DEPLOYMENT_POSTPROCESSING,
                                                                     0)

      headers.push PBXResourcesBuildPhase.new(reference,
                                              reference_comment,
                                              isa,
                                              build_action_mask,
                                              files,
                                              run_only_for_deployment_postprocessing)
    end

    headers
  end

  # @return [PBXBuildPhase]
  def self.resources_phase(lines)
    resources = []
    value_extractor = SafeValueExtractor.new

    section_lines = SectionHighlighter.section_lines(lines, PBXSectionName::PBXResourcesBuildPhase)
    regexp = Regexp.new(PBXRegexp::SINGLE_ELEMENT_SUBSECTION, Regexp::IGNORECASE)

    section_lines.scan(regexp).each do |match|
      reference = match[0].delete("\r\t\n ")
      reference_comment = match[1].delete("\r\t\n")

      subsection = match[2]

      isa = value_extractor.value(subsection,
                                  PBXRegexp::ISA,
                                  DefaultValue::STRING)

      build_action_mask = value_extractor.value(subsection,
                                                PBXRegexp::BUILD_ACTION_MASK,
                                                -1)

      files = []
      files_lines = value_extractor.value(subsection,
                                          PBXRegexp::FILES_LIST,
                                          DefaultValue::STRING)
      files_lines.scan(Regexp.new(PBXRegexp::LIST_FILE_REFERENCE, Regexp::IGNORECASE)) { |match|
        file_reference = match[0].delete("\r\t\n ")
        file_reference_comment = match[1]
        file_location = match[2]
        files.push ListFileReference.new(file_reference,
                                         file_reference_comment,
                                         file_location)
      }

      run_only_for_deployment_postprocessing = value_extractor.value(subsection,
                                                                     PBXRegexp::RUN_ONLY_FOR_DEPLOYMENT_POSTPROCESSING,
                                                                     0)

      resources.push PBXResourcesBuildPhase.new(reference,
                                                reference_comment,
                                                isa,
                                                build_action_mask,
                                                files,
                                                run_only_for_deployment_postprocessing)
    end

    resources
  end

  # @return [PBXBuildPhase]
  def self.shell_scripts(_lines)
    nil
  end

  # @return [PBXBuildPhase]
  def self.sources(lines)
    sources = []
    value_extractor = SafeValueExtractor.new

    section_lines = SectionHighlighter.section_lines(lines, PBXSectionName::PBXSourcesBuildPhase)
    regexp = Regexp.new(PBXRegexp::SINGLE_ELEMENT_SUBSECTION, Regexp::IGNORECASE)

    section_lines.scan(regexp).each do |match|
      reference = match[0].delete("\r\t\n ")
      reference_comment = match[1].delete("\r\t\n")

      subsection = match[2]

      isa = value_extractor.value(subsection,
                                  PBXRegexp::ISA,
                                  DefaultValue::STRING)

      build_action_mask = value_extractor.value(subsection,
                                                PBXRegexp::BUILD_ACTION_MASK,
                                                -1)

      files = []
      files_lines = value_extractor.value(subsection,
                                          PBXRegexp::FILES_LIST,
                                          DefaultValue::STRING)

      files_lines.scan(Regexp.new(PBXRegexp::LIST_FILE_REFERENCE, Regexp::IGNORECASE)) { |match|
        file_reference = match[0].delete("\r\t\n ")
        file_reference_comment = match[1]
        file_location = match[2]
        files.push ListFileReference.new(file_reference,
                                         file_reference_comment,
                                         file_location)
      }

      run_only_for_deployment_postprocessing = value_extractor.value(subsection,
                                                                     PBXRegexp::RUN_ONLY_FOR_DEPLOYMENT_POSTPROCESSING,
                                                                     0)

      sources.push PBXSourcesBuildPhase.new(reference,
                                            reference_comment,
                                            isa,
                                            build_action_mask,
                                            files,
                                            run_only_for_deployment_postprocessing)
    end

    sources
  end

  private_class_method :apple_scripts,
                       :copy_files,
                       :frameworks,
                       :headers,
                       :resources_phase,
                       :shell_scripts,
                       :sources
end
