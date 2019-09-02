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

class TargetFilesIntersector
  # @param [Array] target_names
  # @param [ProjectFile] project_file
  def intersect_targets(target_names, project_file)

    target_names.each do |lhs_target_name|
      target_names.each do |rhs_target_name|
        next unless lhs_target_name != rhs_target_name

        lhs_native_target = project_file.target.native_targets.find do |t|
          t.reference_comment == lhs_target_name
        end

        rhs_native_target = project_file.target.native_targets.find do |t|
          t.reference_comment == rhs_target_name
        end

        lhs_sources_build_phase_reference = lhs_native_target.build_phases.find do |f|
          f.file_name == 'Sources'
        end.reference

        rhs_sources_build_phase_reference = rhs_native_target.build_phases.find do |f|
          f.file_name == 'Sources'
        end.reference

        lhs_target_files = project_file.build_phase.sources_build_phases.find do |f|
          f.reference == lhs_sources_build_phase_reference
        end.files.map(&:file_name)

        rhs_target_files = project_file.build_phase.sources_build_phases.find do |f|
          f.reference == rhs_sources_build_phase_reference
        end.files.map(&:file_name)

        diff = (lhs_target_files - rhs_target_files)

        puts '-----------------------------------------------------------------'
        if diff.empty?
          puts "Diff between #{lhs_target_name} and #{rhs_target_name} contains 0 files."
          puts 'Nice!'
        else
          puts "Diff between #{lhs_target_name} and #{rhs_target_name}: #{diff.size} files."
          puts 'Files list:'
          puts diff
        end

      end
    end

  end

  def build_phase_sources_reference(target_name); end
end
