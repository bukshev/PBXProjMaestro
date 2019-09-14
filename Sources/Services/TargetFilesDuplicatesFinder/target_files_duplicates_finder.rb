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

require_relative '../../Model/ProjectFile/project_file'

class TargetFilesDuplicatesFinder
  # @param [ProjectFile] project_file
  def find_duplicates(project_file)
    project_file.target.native_targets.each do |t|
      sources_metaphase = t.build_phases.find { |f| f.file_name == 'Sources' }
      build_phase = project_file.build_phase.sources_build_phases.find do |f|
        f.reference == sources_metaphase.reference
      end
      files = build_phase.files.map(&:file_name)

      puts '------------------------------------'
      puts "Summary for #{t.name} target:"
      puts find_duplicate_names(files)
      puts '------------------------------------'
    end
  end

  def find_duplicate_names(file_names)
    map = {}
    duplicates = []

    file_names.each do |element|
      map[element] = (map[element] || 0) + 1
      duplicates << element if map[element] == 2
    end

    duplicates
  end
end