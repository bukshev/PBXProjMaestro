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

require_relative '../Utilities/ProjectFileMaker/Common/project_file_maker'
require_relative '../../Sources/Utilities/FileFinder/physical_file_finder'
require_relative '../../Sources/Utilities/FileFinder/pbx_project_file_finder'
require_relative '../Utilities/TargetFilesIntersector/target_files_intersector'

file_path = '/Users/travismurdoc/Documents/Projects/Ruby/PBXProjMaestro/Resources/Qpay.xcodeproj/project.pbxproj'
project_file = ProjectFileMaker.new.project_file(file_path)

intersector = TargetFilesIntersector.new

intersector.intersect_targets(%w[Qpay-DEV Qpay-PUB], project_file)

root_path = '/Users/travismurdoc/Desktop/Common/qpay-ios/Qpay/Qpay'

# physical_file_finder = PhysicalFileFinder.new(root_path)
# pbx_project_file_finder = PBXProjectFileFinder.new(project_file)
#
# all_physical_files = physical_file_finder.all_files_names
# all_pbx_project_files = pbx_project_file_finder.all_files_names
#
# puts all_physical_files.size
# puts all_pbx_project_files.size
#
# puts (all_physical_files - all_pbx_project_files).size
# puts (all_pbx_project_files - all_physical_files).size

# puts physical_file_finder.file_exists_in_project?('TransferPaymentResultRepository.swift')
# puts pbx_project_file_finder.file_exists_in_project?('TransferPaymentResultRepository.swift')
