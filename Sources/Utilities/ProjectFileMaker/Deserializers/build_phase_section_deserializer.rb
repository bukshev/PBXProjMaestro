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
require_relative '../../../Model/ProjectFile/Elements/BuildPhase/pbx_build_phase'
require_relative '../../../../Sources/Utilities/ProjectFileMaker/Common/section_highlighter'
require_relative '../../../../Sources/Common/pbxproj_regexps'
require_relative '../../../../Sources/Model/ProjectFile/Elements/Common/list_file_reference'

class BuildPhaseSectionDeserializer
  # @return [PBXBuildPhase]
  def self.entity(lines)
    # apple_scripts = apple_scripts(lines)
    # puts apple_scripts
    # copy_files = copy_files(lines)
    # puts copy_files

    frameworks = frameworks(lines)
    puts frameworks
    #
    # headers = headers(lines)
    # puts headers
    #
    # resources_phase = resources_phase(lines)
    # puts resources_phase
    #
    # shell_scripts = shell_scripts(lines)
    # puts shell_scripts
    #
    # sources = sources(lines)
    # puts sources

    # PBXBuildPhase.new(apple_scripts,
    #                   copy_files,
    #                   frameworks,
    #                   headers,
    #                   resources_phase,
    #                   shell_scripts,
    #                   sources)
  end

  # @return [PBXAppleScriptBuildPhase]
  def self.apple_scripts(lines)
    # TODO: Temporary unavailable. Try to add apple script to pbxproj.
    # TODO: Use nil-object pattern for cases like this?
    nil
  end

  # @return [PBXCopyFilesBuildPhase]
  def self.copy_files(lines)
    copy_files = []

    section_lines = SectionHighlighter.section_lines(lines, 'PBXCopyFilesBuildPhase')
    regexp = Regexp.new(MaestroRegexp::SINGLE_ELEMENT_SUBSECTION, Regexp::IGNORECASE)
    section_lines.scan(regexp).each do |match|
      reference = match[0].delete("\r\t\n ")
      reference_comment = match[1].delete("\r\t\n")

      subsection = match[2]
      isa = subsection.match(Regexp.new(MaestroRegexp::ISA_LINE, Regexp::IGNORECASE))[1]
      buildActionMask = subsection.match(Regexp.new(MaestroRegexp::BUILD_ACTION_MASK, Regexp::IGNORECASE))[1]
      dstPath = subsection.match(Regexp.new(MaestroRegexp::DST_PATH, Regexp::IGNORECASE))[1]
      dstSubfolderSpec = subsection.match(Regexp.new(MaestroRegexp::DST_SUBFOLDER_SPEC, Regexp::IGNORECASE))[1]
      files_lines = subsection.match(Regexp.new(MaestroRegexp::FILES_LIST, Regexp::IGNORECASE))[0]

      files = []
      files_lines.scan(Regexp.new(MaestroRegexp::LIST_FILE_REFERENCE, Regexp::IGNORECASE)) { |match|
        file_ref = match[0].delete("\r\t\n ")
        file_name = match[1]
        file_location = match[2]
        files.push ListFileReference.new(file_ref, file_name, file_location)
      }

      # TODO: Parse optional name field here. Currently send reference_comment.
      runOnlyForDeploymentPostprocessing = subsection.match(Regexp.new(MaestroRegexp::RUN_ONLY_FOR_DEPLOYMENT_POSTPROCESSING, Regexp::IGNORECASE))[1].to_i

      copy_files.push PBXCopyFilesBuildPhase.new(reference,
                                                 reference_comment,
                                                 isa,
                                                 buildActionMask,
                                                 dstPath,
                                                 dstSubfolderSpec,
                                                 files,
                                                 reference_comment,
                                                 runOnlyForDeploymentPostprocessing)
    end

    copy_files
  end

  # @return [PBXBuildPhase]
  def self.frameworks(section_lines)
    # .0: reference
    # .1: isa
    # .2: build_action_mask
    # .3: files
    # .4: @run_only_for_deployment_postprocessing (currently always 0)
    regexp_str = '([0-9A-Za-z]{1,}).*\n.*.isa\s=\s([0-9A-Za-z]{1,}).*.\n.*.buildActionMask\s=\s([0-9A-Za-z]{1,}).*.\n.*.files\s=\s\(\n\s+([\s\S]*?(?=\n.*\);))'
    regexp = Regexp.new(regexp_str, Regexp::IGNORECASE)

    section_lines.scan(regexp).map do |data|
      PBXFrameworksBuildPhase.new(data[0], data[1], data[2], data[3].map(&:strip), 0)
    end
  end

  # @return [PBXBuildPhase]
  def self.headers(section_lines)
    # .0: reference
    # .1: isa
    # .2: build_action_mask
    # .3: files
    # .4: @run_only_for_deployment_postprocessing (currently always 0)
    regexp_str = '([0-9A-Za-z]{1,}).*\n.*.isa\s=\s([0-9A-Za-z]{1,}).*.\n.*.buildActionMask\s=\s([0-9A-Za-z]{1,}).*.\n.*.files\s=\s\(\n\s+([\s\S]*?(?=\n.*\);))'
    regexp = Regexp.new(regexp_str, Regexp::IGNORECASE)

    section_lines.scan(regexp).map do |data|
      PBXHeadersBuildPhase.new(data[0], data[1], data[2], data[3].map(&:strip), 0)
    end
  end

  # @return [PBXBuildPhase]
  def self.resources_phase(section_lines)
    # .0: reference
    # .1: isa
    # .2: build_action_mask
    # .3: files
    # .4: @run_only_for_deployment_postprocessing (currently always 0)
    regexp_str = '([0-9A-Za-z]{1,}).*\n.*.isa\s=\s([0-9A-Za-z]{1,}).*.\n.*.buildActionMask\s=\s([0-9A-Za-z]{1,}).*.\n.*.files\s=\s\(\n\s+([\s\S]*?(?=\n.*\);))'
    regexp = Regexp.new(regexp_str, Regexp::IGNORECASE)

    section_lines.scan(regexp).map do |data|
      PBXResourcesBuildPhase.new(data[0], data[1], data[2], data[3].split(/\s*,\s*/), 0)
    end
  end

  # @return [PBXBuildPhase]
  def self.shell_scripts(section_lines)
    # .0: reference
    # .1: build_file_name
    # .2: isa
    # .3: file_ref
    # .4: settings (currently always nil)
    regexp_str = '([0-9A-Za-z]{1,}).\/\*.([0-9A-Za-z]{1,}.*).in.*.isa\s=\s([0-9A-Za-z]{1,}).\sfileRef\s=\s([0-9A-Za-z]{1,})'
    regexp = Regexp.new(regexp_str, Regexp::IGNORECASE)

    section_lines.scan(regexp).map do |data|
      PBXShellScriptBuildPhase.new(data[0], data[1], data[2], data[3], data[4],
                                   data[5], data[6], data[7], data[8], data[9])
    end
  end

  # @return [PBXBuildPhase]
  def self.sources(section_lines)
    # .0: reference
    # .1: isa
    # .2: build_action_mask
    # .3: files
    # .4: @run_only_for_deployment_postprocessing (currently always 0)
    regexp_str = '([0-9A-Za-z]{1,}).*\n.*.isa\s=\s([0-9A-Za-z]{1,}).*.\n.*.buildActionMask\s=\s([0-9A-Za-z]{1,}).*.\n.*.files\s=\s\(\n\s+([\s\S]*?(?=\n.*\);))'
    regexp = Regexp.new(regexp_str, Regexp::IGNORECASE)

    section_lines.scan(regexp).map do |data|
      PBXSourcesBuildPhase.new(data[0], data[1], data[2], data[3].map(&:strip), 0)
    end
  end

  private_class_method :apple_scripts,
                       :copy_files,
                       :frameworks,
                       :headers,
                       :resources_phase,
                       :shell_scripts,
                       :sources
end
