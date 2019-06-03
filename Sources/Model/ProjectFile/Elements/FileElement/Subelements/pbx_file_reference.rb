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

# A PBXFileReference is used to track every external file referenced by the project:
# source files, resource files, libraries, generated application files, and so on.
class PBXFileReference
  # @!attribute [r] reference
  #   A 96 bits identifier.
  #   @return [UUID]
  attr_reader :reference

  # @!attribute [r] file_ref_name
  #   Filename in comment after general reference field.
  #   @return [String]
  attr_reader :file_ref_name

  # @!attribute [r] isa
  #   @return [PBXFileReference]
  attr_reader :isa

  # @!attribute [r] file_encoding
  #   See the PBXFileEncoding enumeration.
  #   @return [Number]
  attr_reader :file_encoding

  # @!attribute [r] explicit_file_type
  #   See the PBXFileType enumeration.
  #   @return [String]
  attr_reader :explicit_file_type

  # @!attribute [r] last_known_file_type
  #   See the PBXFileType enumeration.
  #   @return [String]
  attr_reader :last_known_file_type

  # @!attribute [r] name
  #   The filename.
  #   Optional. Use <file_ref_name> or last part of <path>.
  #   @return [String]
  attr_reader :name

  # @!attribute [r] path
  #   The path to the filename.
  #   @return [String]
  attr_reader :path

  # @!attribute [r] source_tree
  #   See the PBXSourceTree enumeration.
  #   @return [String]
  attr_reader :source_tree

  def initialize(reference,
                 file_ref_name,
                 isa,
                 file_encoding,
                 explicit_file_type,
                 last_known_file_type,
                 name,
                 path,
                 source_tree)

    @reference = reference
    @file_ref_name = file_ref_name
    @isa = isa
    @file_encoding = file_encoding
    @explicit_file_type = explicit_file_type
    @last_known_file_type = last_known_file_type
    @name = name
    @path = path
    @source_tree = source_tree
  end
end

# Example:
#
# /* Begin PBXFileReference section */
#
#     F485BA5F22532463006DA0D5 /* ABCProject.app */ = {
#       isa = PBXFileReference;
#       explicitFileType = wrapper.application;
#       includeInIndex = 0;
#       path = ABCProject.app;
#       sourceTree = BUILT_PRODUCTS_DIR;
#     };
#     F485BA6222532463006DA0D5 /* AppDelegate.swift */ = {
#       isa = PBXFileReference;
#       lastKnownFileType = sourcecode.swift;
#       path = AppDelegate.swift;
#       sourceTree = "<group>";
#     };
#     F485BA6422532463006DA0D5 /* ViewController.swift */ = {
#       isa = PBXFileReference;
#       lastKnownFileType = sourcecode.swift;
#       path = ViewController.swift;
#       sourceTree = "<group>";
#     };
#     F485BA6722532463006DA0D5 /* Base */ = {
#       isa = PBXFileReference;
#       lastKnownFileType = file.storyboard;
#       name = Base;
#       path = Base.lproj/Main.storyboard;
#       sourceTree = "<group>";
#     };
#     F485BA6922532465006DA0D5 /* Assets.xcassets */ = {
#       isa = PBXFileReference;
#       lastKnownFileType = folder.assetcatalog;
#       path = Assets.xcassets;
#       sourceTree = "<group>";
#     };
#
# /* End PBXFileReference section */