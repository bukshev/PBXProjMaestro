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

class PBXFilesFinder
  # @!attribute [r] project_file
  #   @return [ProjectFile]
  attr_reader :project_file

  # @param [ProjectFile] project_file
  def initialize(project_file)
    @project_file = project_file
  end

  # @return [Array]
  def file_names(target_name, file_extensions)
    files_with_extensions = target_files(target_name).filter do |p|
      !File.directory?(p) && file_extensions.include?(File.extname(p))
    end

    files_with_extensions.map { |n| File.basename n }
  end

  # @return [Array]
  def all_file_names(file_extensions)
    all_native_targets.reduce([]) do |memo, t|
      memo << file_names(t, file_extensions)
    end
  end

  # @return [Array]
  def all_native_targets
    @project_file.target.native_targets.map(&:name)
  end

  # Obtain list with file names for specific target.
  # @param [String] target_name
  # @return [Array]
  def target_files(target_name)
    native_target = native_target target_name
    sources_reference = sources_build_phase_reference native_target

    build_phase = project_file.build_phase.sources_build_phases.find do |f|
      f.reference == sources_reference
    end

    build_phase.files.map(&:file_name)
  end

  # Obtain PBXNativeTarget for specific target.
  # @param [String] target_name
  # @return [PBXNativeTarget]
  def native_target(target_name)
    project_file.target.native_targets.find do |t|
      t.reference_comment == target_name
    end
  end

  # Obtain sources reference in BuildPhases for specific target.
  # @param [String] target
  # @return [String]
  def sources_build_phase_reference(target)
    build_phase = target.build_phases.find do |p|
      p.file_name == Environment::BUILD_PHASE_SOURCES_SECTION_NAME
    end

    build_phase.reference
  end
end
