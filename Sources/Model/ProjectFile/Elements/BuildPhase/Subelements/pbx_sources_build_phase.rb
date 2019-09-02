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

# This is the element for the sources compilation build phase.
class PBXSourcesBuildPhase
  # @!attribute [r] reference
  #   A 96 bits identifier.
  #   @return [UUID]
  attr_reader :reference

  # @!attribute [r] reference_comment
  #   Name after UUID in comment section.
  #   @return [String]
  attr_reader :reference_comment

  # @!attribute [r] isa
  #   @return [PBXSourcesBuildPhase]
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
                 reference_comment,
                 isa,
                 build_action_mask,
                 files,
                 run_only_for_deployment_postprocessing)

    @reference = reference
    @reference_comment = reference_comment
    @isa = isa
    @build_action_mask = build_action_mask
    @files = files
    @run_only_for_deployment_postprocessing = run_only_for_deployment_postprocessing
  end
end

# Example:
#
# /* Begin PBXSourcesBuildPhase section */
#
#     F485BA5B22532463006DA0D5 /* Sources */ = {
#       isa = PBXSourcesBuildPhase;
#       buildActionMask = 2147483647;
#       files = (
#         F485BA6522532463006DA0D5 /* ViewController.swift in Sources */,
#         F485BA6322532463006DA0D5 /* AppDelegate.swift in Sources */,
#       );
#       runOnlyForDeploymentPostprocessing = 0;
#     };
#     F485BA6F22532465006DA0D5 /* Sources */ = {
#       isa = PBXSourcesBuildPhase;
#       buildActionMask = 2147483647;
#       files = (
#         F485BA7822532465006DA0D5 /* ABCProjectTests.swift in Sources */,
#       );
#       runOnlyForDeploymentPostprocessing = 0;
#     };
#     F485BA7A22532465006DA0D5 /* Sources */ = {
#       isa = PBXSourcesBuildPhase;
#       buildActionMask = 2147483647;
#       files = (
#         F485BA8322532465006DA0D5 /* ABCProjectUITests.swift in Sources */,
#       );
#       runOnlyForDeploymentPostprocessing = 0;
#     };
#     F485BA9522532498006DA0D5 /* Sources */ = {
#       isa = PBXSourcesBuildPhase;
#       buildActionMask = 2147483647;
#       files = (
#         F485BA9622532498006DA0D5 /* ViewController.swift in Sources */,
#         F485BA9722532498006DA0D5 /* AppDelegate.swift in Sources */,
#       );
#       runOnlyForDeploymentPostprocessing = 0;
#     };
#
# /* End PBXSourcesBuildPhase section */