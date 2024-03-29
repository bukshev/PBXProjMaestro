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

require_relative '../../../../Sources/Utilities/ProjectFileMaker/Deserializers/build_file_section_deserializer'
require_relative '../../../../Sources/Utilities/ProjectFileMaker/Deserializers/build_phase_section_deserializer'
require_relative '../Deserializers/file_element_section_deserializer'
require_relative '../../../../Sources/Utilities/ProjectFileMaker/Common/section_highlighter'
require_relative '../../../../Sources/Model/ProjectFile/project_file'
require_relative '../../../Utilities/ProjectFileMaker/Deserializers/target_section_deserializer'

class ProjectFileMaker
  def project_file(file_path)
    # Read all lines from .pbxproj file.
    pbxproj_lines = File.read(file_path, encoding: 'utf-8').freeze

    # DONE. Deserialize BuildFile section.
    build_file_lines = SectionHighlighter.section_lines(pbxproj_lines, 'PBXBuildFile')
    build_files = BuildFileSectionDeserializer.entity build_file_lines
    # puts build_files

    # DONE. Deserialize all BuildPhase sections to one abstract.
    build_phase = BuildPhaseSectionDeserializer.entity pbxproj_lines
    # puts build_phase

    # DONE. Deserialize all FileElement sections to one abstract.
    file_element = FileElementSectionDeserializer.entity pbxproj_lines
    # puts file_element

    # Deserialize all Target sections to one abstract.
    target = TargetSectionDeserializer.entity pbxproj_lines
    # puts target

    ProjectFile.new(nil,
                    build_files,
                    build_phase,
                    nil,
                    file_element,
                    target,
                    nil,
                    nil,
                    nil,
                    nil)
  end
end
