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

# This is the element for referencing other target through content proxies.
class PBXTargetDependency
  # @!attribute [r] reference
  #   A 96 bits identifier.
  #   @return [UUID]
  attr_reader :reference

  # @!attribute [r] isa
  #   @return [PBXTargetDependency]
  attr_reader :isa

  # @!attribute [r] target
  #   An element reference.
  #   The object is a reference to a PBXNativeTarget element.
  #   @return [Reference]
  attr_reader :target

  # @!attribute [r] target_proxy
  #   An element reference.
  #   The object is a reference to a PBXContainerItemProxy element.
  #   @return [Reference]
  attr_reader :target_proxy

  def initialize(reference, isa, target, target_proxy)
    @reference = reference
    @isa = isa
    @target = target
    @target_proxy = target_proxy
  end
end

# Example:
#
# /* Begin PBXTargetDependency section */
#
#     F485BA7522532465006DA0D5 /* PBXTargetDependency */ = {
#       isa = PBXTargetDependency;
#       target = F485BA5E22532463006DA0D5 /* ABCProject */;
#       targetProxy = F485BA7422532465006DA0D5 /* PBXContainerItemProxy */;
#     };
#     F485BA8022532465006DA0D5 /* PBXTargetDependency */ = {
#       isa = PBXTargetDependency;
#       target = F485BA5E22532463006DA0D5 /* ABCProject */;
#       targetProxy = F485BA7F22532465006DA0D5 /* PBXContainerItemProxy */;
#     };
#
# /* End PBXTargetDependency section */