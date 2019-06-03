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

class BuildPhaseSectionDeserializer
  # @return [PBXBuildPhase]
  def self.entity(section_lines)

  puts resources_phase(section_lines)[0].files

    # PBXBuildPhase.new(apple_scripts(section_lines),
    #                   copy_files(section_lines),
    #                   frameworks(section_lines),
    #                   headers(section_lines),
    #                   resources_phase(section_lines),
    #                   shell_scripts(section_lines),
    #                   sources(section_lines))
  end

  # @return [PBXBuildPhase]
  def self.apple_scripts(section_lines)
    # .0: reference
    # .1: isa
    # .2: build_action_mask
    # .3: files
    # .4: @run_only_for_deployment_postprocessing (currently always 0)
    regexp_str = '([0-9A-Za-z]{1,}).*\n.*.isa\s=\s([0-9A-Za-z]{1,}).*.\n.*.buildActionMask\s=\s([0-9A-Za-z]{1,}).*.\n.*.files\s=\s\(\n\s+([\s\S]*?(?=\n.*\);))'
    regexp = Regexp.new(regexp_str, Regexp::IGNORECASE)

    section_lines.scan(regexp).map do |data|
      PBXAppleScriptBuildPhase.new(data[0], data[1], data[2], data[3].map(&:strip), 0)
    end
  end

  # @return [PBXBuildPhase]
  def self.copy_files(section_lines)
    # .0: reference
    # .1: build_file_name
    # .2: isa
    # .3: file_ref
    # .4: settings (currently always nil)
    regexp_str = '([0-9A-Za-z]{1,}).\/\*.([0-9A-Za-z]{1,}.*).in.*.isa\s=\s([0-9A-Za-z]{1,}).\sfileRef\s=\s([0-9A-Za-z]{1,})'
    regexp = Regexp.new(regexp_str, Regexp::IGNORECASE)

    section_lines.scan(regexp).map do |data|
      PBXCopyFilesBuildPhase.new(data[0], data[1], data[2], data[3], data[4],
                                 data[5], data[6])
    end
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
