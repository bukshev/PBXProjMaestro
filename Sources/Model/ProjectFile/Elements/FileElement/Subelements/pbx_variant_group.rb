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

# This is the element for referencing localized resources.
class PBXVariantGroup
  # @!attribute [r] reference
  #   A 96 bits identifier.
  #   @return [UUID]
  attr_reader :reference

  # @!attribute [r] isa
  #   @return [PBXVariantGroup]
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

  def initialize(reference, isa, children, name, source_tree)
    @reference = reference
    @isa = isa
    @children = children
    @name = name
    @source_tree = source_tree
  end
end

# Example:
#
# /* Begin PBXVariantGroup section */
#
#     F485BA6622532463006DA0D5 /* Main.storyboard */ = {
#       isa = PBXVariantGroup;
#       children = (
#         F485BA6722532463006DA0D5 /* Base */,
#       );
#       name = Main.storyboard;
#       sourceTree = "<group>";
#     };
#     F485BA6B22532465006DA0D5 /* LaunchScreen.storyboard */ = {
#       isa = PBXVariantGroup;
#       children = (
#         F485BA6C22532465006DA0D5 /* Base */,
#       );
#       name = LaunchScreen.storyboard;
#       sourceTree = "<group>";
#     };
#
# /* End PBXVariantGroup section */