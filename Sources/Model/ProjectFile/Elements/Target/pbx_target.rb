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

# This element is an abstract parent for specialized targets.
class PBXTarget
  # @!attribute [r] aggregate_targets
  #   @return [List of PBXAggregateTarget]
  attr_reader :aggregate_targets

  # @!attribute [r] legacy_targets
  #   @return [PBXLegacyTarget]
  attr_reader :legacy_targets

  # @!attribute [r] native_targets
  #   @return [[PBXNativeTarget]]
  attr_reader :native_targets

  def initialize(aggregate_targets, legacy_targets, native_targets)
    @aggregate_targets = aggregate_targets
    @legacy_targets = legacy_targets
    @native_targets = native_targets
  end
end