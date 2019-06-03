# frozen_string_literal: true

#  pbx_build_file.rb
#  PBXProjOptimizer
#
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

# This element indicate a file reference that is used
# in a PBXBuildPhase (either as an include or resource).
class PBXBuildFile
  # @!attribute [r] reference
  #   A 96 bits identifier.
  #   @return [UUID]
  attr_reader :reference

  # @!attribute [r] build_file_name
  #   Filename in comment after general reference field.
  #   @return [String]
  attr_reader :build_file_name

  # @!attribute [r] isa
  #   @return [PBXBuildFile]
  attr_reader :isa

  # @!attribute [r] fileRef
  #   An element reference.
  #   The object is a reference to a PBXFileReference element.
  #   @return [Reference]
  attr_reader :file_ref

  # @!attribute [r] settings
  #   A map of key/value pairs for additional settings.
  #   Currently always nil.
  #   @return [Map]
  attr_reader :settings

  def initialize(reference,
                 build_file_name,
                 isa,
                 file_ref,
                 settings)

    @reference = reference
    @build_file_name = build_file_name
    @isa = isa
    @file_ref = file_ref
    @settings = settings
  end
end

# Example:
#
# /* Begin PBXBuildFile section */
#
#     F485BA6322532463006DA0D5 /* AppDelegate.swift in Sources */ = {
#       isa = PBXBuildFile;
#       fileRef = F485BA6222532463006DA0D5 /* AppDelegate.swift */;
#     };
#     F485BA9722532498006DA0D5 /* AppDelegate.swift in Sources */ = {
#       isa = PBXBuildFile;
#       fileRef = F485BA6222532463006DA0D5 /* AppDelegate.swift */;
#     };
#     F485BA9A22532498006DA0D5 /* LaunchScreen.storyboard in Resources */ = {
#       isa = PBXBuildFile;
#       fileRef = F485BA6B22532465006DA0D5 /* LaunchScreen.storyboard */;
#     };
#     F485BA9B22532498006DA0D5 /* Assets.xcassets in Resources */ = {
#       isa = PBXBuildFile;
#       fileRef = F485BA6922532465006DA0D5 /* Assets.xcassets */;
#     };
#
# /* End PBXBuildFile section */