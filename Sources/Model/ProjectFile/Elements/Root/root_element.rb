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

# The root section contains the general information.
class RootElement
  # @!attribute [r] archive_version
  #   Default value: 1
  #   @return [Number]
  attr_reader :archive_version

  # @!attribute [r]
  #   @return [List]
  attr_reader :classes

  # @!attribute [r]
  #   See XcodeCompatibilityVersion enumeration.
  #   @return [Number]
  attr_reader :object_version

  # @!attribute [r]
  #   A map of element.
  #   The map is indexed by the elements identifier.
  #   @return [Map]
  attr_reader :objects

  # @!attribute [r]
  #   An element reference.
  #   The object is a reference to a PBXProject element.
  #   @return [Reference]
  attr_reader :root_object

  def initialize(archive_version, classes, object_version, objects, root_object)
    @archive_version = archive_version
    @classes = classes
    @object_version = object_version
    @objects = objects
    @root_object = root_object
  end
end

# Example:
#
# // !$*UTF8*$!
# {
#     archiveVersion = 1;
#     classes = {
#     };
#     objectVersion = 45;
#     objects = {
#
#     ...
#
#     };
#     rootObject = 0867D690FE84028FC02AAC07 /* Project object */;
# }