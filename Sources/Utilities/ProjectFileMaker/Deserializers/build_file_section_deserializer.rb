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

require_relative '../../../Model/ProjectFile/Elements/BuildFile/pbx_build_file'

# Build PBXBuildFile entity.
class BuildFileSectionDeserializer

  # @return [PBXBuildFile]
  def self.entity(section_lines)
    # .0: reference
    # .1: build_file_name
    # .2: isa
    # .3: file_ref
    # .4: settings (currently always nil)
    regexp_str = '([0-9A-Za-z]{1,}).\/\*.([0-9A-Za-z]{1,}.*).in.*.isa\s=\s([0-9A-Za-z]{1,}).\sfileRef\s=\s([0-9A-Za-z]{1,})'
    regexp = Regexp.new(regexp_str, Regexp::IGNORECASE)

    section_lines.scan(regexp).map do |data|
      PBXBuildFile.new(data[0], data[1], data[2], data[3], nil)
    end
  end
end