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

# This is the element for the framework link build phase.
class PBXHeadersBuildPhase
  # @!attribute [r] reference
  #   A 96 bits identifier.
  #   @return [UUID]
  attr_reader :reference

  # @!attribute [r] isa
  #   @return [PBXHeadersBuildPhase]
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

  # @!attribute [r] run_only_for_deployment_postprocessing
  #   Default value: 0
  #   @return [Number]
  attr_reader :run_only_for_deployment_postprocessing

  def initialize(reference,
                 isa,
                 build_action_mask,
                 files,
                 run_only_for_deployment_postprocessing)

    @reference = reference
    @isa = isa
    @build_action_mask = build_action_mask
    @files = files
    @run_only_for_deployment_postprocessing = run_only_for_deployment_postprocessing
  end
end

# Example:
#
# 87293EBC1153C114007AFD45 /* Headers */ = {
#     isa = PBXHeadersBuildPhase;
#     buildActionMask = 2147483647;
#     files = (
#     );
#     runOnlyForDeploymentPostprocessing = 0;
# };