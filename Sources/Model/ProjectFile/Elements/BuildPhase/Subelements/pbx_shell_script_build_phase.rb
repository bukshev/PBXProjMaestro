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

# This is the element for the resources copy build phase.
class PBXShellScriptBuildPhase
  # @!attribute [r] reference
  #   A 96 bits identifier.
  #   @return [UUID]
  attr_reader :reference

  # @!attribute [r] build_phase_name
  #   Build phase name in comment after general reference field.
  #   @return [String]
  attr_reader :build_phase_name

  # @!attribute [r] isa
  #   @return [PBXShellScriptBuildPhase]
  attr_reader :isa

  # @!attribute [r] build_action_mask
  #   Default value: 2^32-1
  #   @return [Number]
  attr_reader :build_action_mask

  # @!attribute [r] files
  #   A list of element reference.
  #   The objects are a reference to a PBXBuildFile element.
  #   @return [List]
  attr_reader :files

  # @!attribute [r] input_paths
  #   @return [List]
  attr_reader :input_paths

  # @!attribute [r] output_paths
  #   @return [List]
  attr_reader :output_paths

  # @!attribute [r] run_only_for_deployment_postprocessing
  #   Default value: 0
  #   @return [Number]
  attr_reader :run_only_for_deployment_postprocessing

  # @!attribute [r] shell_path
  #   @return [String]
  attr_reader :shell_path

  # @!attribute [r] shell_script
  #   @return [String]
  attr_reader :shell_script

  def initialize(reference,
                 build_phase_name,
                 isa,
                 build_action_mask,
                 files,
                 input_paths,
                 output_paths,
                 run_only_for_deployment_postprocessing,
                 shell_path,
                 shell_script)

    @reference = reference
    @build_phase_name = build_phase_name
    @isa = isa
    @build_action_mask = build_action_mask
    @files = files
    @input_paths = input_paths
    @output_paths = output_paths
    @run_only_for_deployment_postprocessing = run_only_for_deployment_postprocessing
    @shell_path = shell_path
    @shell_script = shell_script
  end
end

# Example:
#
# /* Begin PBXShellScriptBuildPhase section */
#
# 8A77FCE71D588DFB00DAAA6D /* Run Script */ = {
#   isa = PBXShellScriptBuildPhase;
#   buildActionMask = 2147483647;
#   files = (
#   );
#   inputPaths = (
#   );
#   name = "Run Script";
#   outputPaths = (
#   );
#   runOnlyForDeploymentPostprocessing = 0;
#   shellPath = /bin/sh;
#   shellScript = "#!/bin/sh\n\nset -e\nset -o pipefail\n\nBUILD_STUFF_PAT....";
# };
# 8A77FCE81D598A7E00DAAA6D /* ShellScript */ = {
#   isa = PBXShellScriptBuildPhase;
#   buildActionMask = 2147483647;
#   files = (
#   );
#   inputPaths = (
#   );
#   outputPaths = (
#   );
#   runOnlyForDeploymentPostprocessing = 0;
#   shellPath = /bin/sh;
#   shellScript = "#!/bin/sh\n\nset -e\nset -o pipefail\n\nBUILD_STUFF_PAT....";
# };
#
# /* End PBXShellScriptBuildPhase section */