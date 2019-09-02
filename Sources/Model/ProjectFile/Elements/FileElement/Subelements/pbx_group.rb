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

# This is the element to group files or groups.
class PBXGroup
  # @!attribute [r] reference
  #   A 96 bits identifier.
  #   @return [UUID]
  attr_reader :reference

  # @!attribute [r] reference_comment
  #   Filename in comment after general reference field.
  #   @return [String]
  attr_reader :reference_comment

  # @!attribute [r] isa
  #   @return [PBXGroup]
  attr_reader :isa

  # @!attribute [r] children
  #   A list of element reference.
  #   The objects are a reference to a PBXFileElement element.
  #   @return [List]
  attr_reader :children

  # @!attribute [r] name
  #   The filename.
  #   @return [String]
  attr_reader :name

  # @!attribute [r] source_tree
  #   See the PBXSourceTree enumeration.
  #   @return [String]
  attr_reader :source_tree

  def initialize(reference, reference_comment, isa, children, name, source_tree)
    @reference = reference
    @reference_comment = reference_comment
    @isa = isa
    @children = children
    @name = name
    @source_tree = source_tree
  end
end

# Example:
#
# /* Begin PBXGroup section */
#
#     F485BA5622532463006DA0D5 = {
#       isa = PBXGroup;
#       children = (
#         F485BA6122532463006DA0D5 /* ABCProject */,
#         F485BA7622532465006DA0D5 /* ABCProjectTests */,
#         F485BA8122532465006DA0D5 /* ABCProjectUITests */,
#         F485BA6022532463006DA0D5 /* Products */,
#         F485BAA222532498006DA0D5 /* ABCProject copy-Info.plist */,
#       );
#       sourceTree = "<group>";
#     };
#     F485BA6022532463006DA0D5 /* Products */ = {
#       isa = PBXGroup;
#       children = (
#         F485BA5F22532463006DA0D5 /* ABCProject.app */,
#         F485BA7322532465006DA0D5 /* ABCProjectTests.xctest */,
#         F485BA7E22532465006DA0D5 /* ABCProjectUITests.xctest */,
#         F485BAA122532498006DA0D5 /* ABCSecondTarget.app */,
#       );
#       name = Products;
#       sourceTree = "<group>";
#     };
#     F485BA6122532463006DA0D5 /* ABCProject */ = {
#       isa = PBXGroup;
#       children = (
#         F485BA6222532463006DA0D5 /* AppDelegate.swift */,
#         F485BA6422532463006DA0D5 /* ViewController.swift */,
#         F485BA6622532463006DA0D5 /* Main.storyboard */,
#         F485BA6922532465006DA0D5 /* Assets.xcassets */,
#         F485BA6B22532465006DA0D5 /* LaunchScreen.storyboard */,
#         F485BA6E22532465006DA0D5 /* Info.plist */,
#       );
#       path = ABCProject;
#       sourceTree = "<group>";
#     };
#     F485BA7622532465006DA0D5 /* ABCProjectTests */ = {
#       isa = PBXGroup;
#       children = (
#         F485BA7722532465006DA0D5 /* ABCProjectTests.swift */,
#         F485BA7922532465006DA0D5 /* Info.plist */,
#       );
#       path = ABCProjectTests;
#       sourceTree = "<group>";
#     };
#     F485BA8122532465006DA0D5 /* ABCProjectUITests */ = {
#       isa = PBXGroup;
#       children = (
#         F485BA8222532465006DA0D5 /* ABCProjectUITests.swift */,
#         F485BA8422532465006DA0D5 /* Info.plist */,
#       );
#       path = ABCProjectUITests;
#       sourceTree = "<group>";
#     };
#
# /* End PBXGroup section */