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

# This is the element for to decorate a target item.
class PBXContainerItemProxy
  # @!attribute [r] reference
  #   A 96 bits identifier.
  #   @return [UUID]
  attr_reader :reference

  # @!attribute [r] isa
  #   @return [PBXContainerItemProxy]
  attr_reader :isa

  # @!attribute [r] container_portal
  #   An element reference.
  #   The object is a reference to a PBXProject element.
  #   @return [Reference]
  attr_reader :container_portal

  # @!attribute [r] proxy_type
  #   Default value: 1
  #   @return [Number]
  attr_reader :proxy_type

  # @!attribute [r] remote_global_id_string
  #   An element reference.
  #   A unique reference ID.
  #   @return [Reference]
  attr_reader :remote_global_id_string

  # @!attribute [r] remote_info
  #   @return [String]
  attr_reader :remote_info

  def initialize(reference,
                 isa,
                 container_portal,
                 proxy_type,
                 remote_global_id_string,
                 remote_info)

    @reference = reference
    @isa = isa
    @container_portal = container_portal
    @proxy_type = proxy_type
    @remote_global_id_string = remote_global_id_string
    @remote_info = remote_info
  end
end

# Example:
#
# /* Begin PBXContainerItemProxy section */
#
#  F485BA7422532465006DA0D5 /* PBXContainerItemProxy */ = {
#    isa = PBXContainerItemProxy;
#    containerPortal = F485BA5722532463006DA0D5 /* Project object */;
#    proxyType = 1;
#    remoteGlobalIDString = F485BA5E22532463006DA0D5;
#    remoteInfo = ABCProject;
#  };
#  F485BA7F22532465006DA0D5 /* PBXContainerItemProxy */ = {
#    isa = PBXContainerItemProxy;
#    containerPortal = F485BA5722532463006DA0D5 /* Project object */;
#    proxyType = 1;
#    remoteGlobalIDString = F485BA5E22532463006DA0D5;
#    remoteInfo = ABCProject;
#  };
#
# /* End PBXContainerItemProxy section */