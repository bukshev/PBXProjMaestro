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

class TargetFilesIntersector
  # Process PBXProjectFile for determine invalid references
  # between all project targets.
  # @param [ProjectFile] project_file
  def intersect_targets(project_file)
    general_targets = general_targets project_file
    tests_targets = tests_targets project_file

    general_targets.each do |lhs_target_name|
      general_targets.each do |rhs_target_name|
        next unless lhs_target_name != rhs_target_name

        process_general_targets(project_file, lhs_target_name, rhs_target_name)
      end
    end

    tests_targets.each do |lhs_target_name|
      general_targets.each do |rhs_target_name|
        next unless lhs_target_name != rhs_target_name

        process_tests_targets(project_file, lhs_target_name, rhs_target_name)
      end
    end
  end

  # Obtain all general targets from PBXProjectFile excluding tests targets.
  # @param [ProjectFile] project_file
  def general_targets(project_file)
    project_file.target.native_targets.map(&:name).reject do |t|
      Environment::TESTS_TARGETS.include?(t)
    end
  end

  # Obtain all tests targets from PBXProjectFile excluding general targets.
  # @param [ProjectFile] project_file
  def tests_targets(project_file)
    project_file.target.native_targets.map(&:name).reject do |t|
      Environment::GENERAL_TARGETS.include?(t)
    end
  end

  # Intersect all general targets between each other
  # for finding all invalid references.
  # @param [ProjectFile] project_file
  # @param [String] lhs_target_name
  # @param [String] rhs_target_name
  def process_general_targets(project_file, lhs_target_name, rhs_target_name)
    lhs_target_files = target_files(project_file, lhs_target_name)
    rhs_target_files = target_files(project_file, rhs_target_name)

    diff = lhs_target_files - rhs_target_files
    print_processing_result(diff, lhs_target_name, rhs_target_name)
  end

  # Intersect all tests targets with all general targets
  # for finding all invalid references.
  # @param [ProjectFile] project_file
  # @param [String] lhs_target_name
  # @param [String] rhs_target_name
  def process_tests_targets(project_file, lhs_target_name, rhs_target_name)
    lhs_target_files = target_files(project_file, lhs_target_name)
    rhs_target_files = target_files(project_file, rhs_target_name)

    diff = lhs_target_files & rhs_target_files
    print_processing_result(diff, lhs_target_name, rhs_target_name)
  end

  # Obtain list with file names for specific target.
  # @param [ProjectFile] project_file
  # @param [String] target_name
  # @return [Array]
  def target_files(project_file, target_name)
    native_target = native_target(project_file, target_name)
    sources_reference = sources_build_phase_reference native_target

    build_phase = project_file.build_phase.sources_build_phases.find do |f|
      f.reference == sources_reference
    end

    build_phase.files.map(&:file_name)
  end

  # Obtain PBXNativeTarget for specific target.
  # @param [ProjectFile] project_file
  # @param [String] target_name
  # @return [PBXNativeTarget]
  def native_target(project_file, target_name)
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

  # Print intersection result for targets processing.
  # @param [Array] diff
  # @param [String] lhs_target_name
  # @param [String] rhs_target_name
  def print_processing_result(diff, lhs_target_name, rhs_target_name)
    print_separator
    if diff.empty?
      puts "There're not any files with #{lhs_target_name}, but without #{rhs_target_name}."
      puts 'Nice!'
    else
      puts "Files with #{lhs_target_name}, but without #{rhs_target_name}: #{diff.size} files."
      puts 'Files list:'
      puts diff
    end
    print_separator
  end

  # Print horizontal line.
  def print_separator
    puts '---------------------------------------------------------------------'
  end

  private :general_targets,
          :tests_targets,
          :process_general_targets,
          :process_tests_targets,
          :target_files,
          :native_target,
          :sources_build_phase_reference,
          :print_processing_result,
          :print_separator
end