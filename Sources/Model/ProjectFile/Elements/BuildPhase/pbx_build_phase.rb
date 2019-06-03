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

# This element is an abstract parent for specialized build phases.
class PBXBuildPhase
  # @!attribute [r] apple_script_build_phases
  #   @return [List of PBXAppleScriptBuildPhase]
  attr_reader :apple_script_build_phases

  # @!attribute [r] copy_files_build_phases
  #   @return [List of PBXCopyFilesBuildPhase]
  attr_reader :copy_files_build_phases

  # @!attribute [r] frameworks_build_phases
  #   @return [List of PBXFrameworksBuildPhase]
  attr_reader :frameworks_build_phases

  # @!attribute [r] headers_build_phases
  #   @return [List of PBXHeadersBuildPhase]
  attr_reader :headers_build_phases

  # @!attribute [r] resources_build_phases
  #   @return [List of PBXResourcesBuildPhase]
  attr_reader :resources_build_phases

  # @!attribute [r] shell_script_build_phases
  #   @return [List of PBXShellScriptBuildPhase]
  attr_reader :shell_script_build_phases

  # @!attribute [r] sources_build_phases
  #   @return [List of PBXSourcesBuildPhase]
  attr_reader :sources_build_phases

  def initialize(apple_script_build_phases,
                 copy_files_build_phases,
                 frameworks_build_phases,
                 headers_build_phases,
                 resources_build_phases,
                 shell_script_build_phases,
                 sources_build_phases)

    @apple_script_build_phases = apple_script_build_phases
    @copy_files_build_phases = copy_files_build_phases
    @frameworks_build_phases = frameworks_build_phases
    @headers_build_phases = headers_build_phases
    @resources_build_phases = resources_build_phases
    @shell_script_build_phases = shell_script_build_phases
    @sources_build_phases = sources_build_phases
  end
end