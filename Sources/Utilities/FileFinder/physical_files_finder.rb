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

class PhysicalFilesFinder
  # @!attribute [r] root_directory_path
  #   @return [String]
  attr_reader :root_directory_path

  # @!attribute [r] targets_with_pathways
  #   @return [Hash]
  attr_reader :targets_with_pathways

  # @param [Hash] targets_with_pathways
  def initialize(root_directory_path, targets_with_pathways)
    @root_directory_path = root_directory_path
    @targets_with_pathways = targets_with_pathways
  end

  # @param [String] target_name
  # @param [Array] file_extensions
  # @return [Array]
  def file_names(target_name, file_extensions)
    path = targets_with_pathways[target_name]

    files_with_extensions = Dir[path + '/**/*'].filter do |p|
      !File.directory?(p) && file_extensions.include?(File.extname(p))
    end

    files_with_extensions.map { |f| File.basename f }
  end

  # @param [Array] file_extensions
  # @return [Array]
  def all_file_names(file_extensions)
    files_with_extensions = Dir[@root_directory_path + '/**/*'].filter do |p|
      !File.directory?(p) && file_extensions.include?(File.extname(p))
    end

    files_with_extensions.map { |f| File.basename f }
  end

  # @param [Array] file_extensions
  # @return [Array]
  def targetless_file_names(file_extensions)
    all = all_file_names file_extensions

    targets_file_names = targets_with_pathways.reduce([]) do |memo, (t, _)|
      file_names = file_names(t, file_extensions)
      memo << file_names
    end

    all - targets_file_names
  end
end
