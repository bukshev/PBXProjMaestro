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

require_relative '../../Utilities/FileFinder/pbx_files_finder'
require_relative '../../Utilities/FileFinder/physical_files_finder'

class FilesExistenceMatcher
  # @!attribute [r] pbx_files_finder
  #   @return [PBXFilesFinder]
  attr_reader :pbx_files_finder

  # @!attribute [r] physical_files_finder
  #   @return [PhysicalFilesFinder]
  attr_reader :physical_files_finder

  def initialize(pbx_files_finder, physical_files_finder)
    @pbx_files_finder = pbx_files_finder
    @physical_files_finder = physical_files_finder
  end

  # @param [ProjectFile] project_file
  def match_files(project_file)
    extensions = %w[.m .swift]

    target_names = project_file.target.native_targets.map(&:name)

    target_names.each do |t|
      puts '-------------------------------------------------------------------'
      pbx_file_names = @pbx_files_finder.file_names(t, extensions)
      physical_file_names = @physical_files_finder.file_names(t, extensions)

      puts t
      puts '----'
      puts pbx_file_names.size
      puts physical_file_names.size
      puts '----'
      puts pbx_file_names.uniq.size
      puts physical_file_names.uniq.size
      puts '----'

      diff = pbx_file_names.uniq - physical_file_names.uniq
      if diff.empty?
        puts "There're not any problems with #{t} target."
      else
        puts "#{t}. Files which exists in PBXProjectFile, but not exists physically."
        puts 'Files list:'
        puts diff
      end

      diff = physical_file_names.uniq - pbx_file_names.uniq
      if diff.empty?
        puts "There're not any problems with #{t} target."
      else
        puts "#{t}. Files which exists physically, but not exists in PBXProjectFile."
        puts 'Files list:'
        puts diff
      end
      puts '-------------------------------------------------------------------'
    end
  end
end
