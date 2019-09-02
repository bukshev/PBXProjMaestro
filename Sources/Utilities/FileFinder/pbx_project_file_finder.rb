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

class PBXProjectFileFinder
  attr_reader :project_file

  def initialize(project_file)
    @project_file = project_file
  end

  def all_files_names
    project_file
      .build_files
      .map(&:build_file_name)
      .filter { |name| ['.m', '.swift', ''].include?(File.extname(name)) }
  end

  def file_exists_in_project?(file_name)
    # TODO: Replace PBXBuildFile with actual files sources.
    project_file
      .build_files
      .map(&:build_file_name)
      .include?(file_name)
  end

  # def file_exists_in_relative_directory?(file_name, relative_directory_path); end
end
