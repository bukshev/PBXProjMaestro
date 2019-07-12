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

# This is the element for the copy file build phase.
class PBXCopyFilesBuildPhase
  # @!attribute [r] reference
  #   A 96 bits identifier.
  #   @return [UUID]
  attr_reader :reference

  # @!attribute [r] reference_comment
  #   Name after UUID in comment section.
  #   @return [String]
  attr_reader :reference_comment

  # @!attribute [r] isa
  #   @return [PBXCopyFilesBuildPhase]
  attr_reader :isa

  # @!attribute [r] build_action_mask
  #   Default value: 2^32-1
  #   @return [Number]
  attr_reader :build_action_mask

  # @!attribute [r] dst_path
  #   The destination path.
  #   @return [PBXBuildFile]
  attr_reader :dst_path

  # @!attribute [r] dst_subfolder_spec
  #   @return [Number]
  attr_reader :dst_subfolder_spec

  # @!attribute [r] files
  #   A list of element reference (#ListFileReference).
  #   The objects are a reference to a #PBXBuildFile element.
  #   @return [List of #ListFileReference]
  attr_reader :files

  # @!attribute [r] name
  #   Section name. Can be same as #reference_comment.
  #   @return [String]
  attr_reader :name

  # @!attribute [r] run_only_for_deployment_postprocessing
  #   Default value: 0
  #   @return [Number]
  attr_reader :run_only_for_deployment_postprocessing

  def initialize(reference,
                 reference_comment,
                 isa,
                 build_action_mask,
                 dst_path,
                 dst_subfolder_spec,
                 files,
                 name,
                 run_only_for_deployment_postprocessing)

    @reference = reference
    @reference_comment = reference_comment
    @isa = isa
    @build_action_mask = build_action_mask
    @dst_path = dst_path
    @dst_subfolder_spec = dst_subfolder_spec
    @files = files
    @name = name
    @run_only_for_deployment_postprocessing = run_only_for_deployment_postprocessing
  end
end