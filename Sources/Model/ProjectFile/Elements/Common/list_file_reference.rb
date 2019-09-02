# frozen_string_literal: true

#  list_file_reference.rb
#  PBXProjMaestro
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

# Single simple FileRef description.
# Can be contained in subsections fileRef-lists.
# subsections.
class ListFileReference
  # @!attribute [r] reference
  #   A 96 bits identifier.
  #   @return [UUID]
  attr_reader :reference

  # @!attribute [r] file_name
  #   File name in comment after general reference field.
  #   @return [String]
  attr_reader :file_name

  # @!attribute [r] location
  #   String destination which located in comment after general reference field.
  #   @return [String] or @return nil
  attr_reader :location

  def initialize(reference, file_name, location)
    @reference = reference
    @file_name = file_name
    @location = location
  end
end