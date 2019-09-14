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

require '../../Sources/Model/ProjectFile/project_file'
require '../Utilities/ProjectFileMaker/Common/project_file_maker'
require '../Utilities/FileFinder/pbx_files_finder'
require '../Utilities/FileFinder/physical_files_finder'
require '../Services/FilesExistenceMathcer/files_existence_matcher'
require '../Services/TargetFilesDuplicatesFinder/target_files_duplicates_finder'
require '../Services/TargetFilesIntersector/target_files_intersector'

project_file_maker = ProjectFileMaker.new
# project_file_path = '/Users/travismurdoc/Desktop/Dev/qpay-ios/Qpay/Qpay.xcodeproj/project.pbxproj'
project_file_path = '/Users/travismurdoc/Desktop/qpay-ios/Qpay/Qpay.xcodeproj/project.pbxproj'
project_file = project_file_maker.project_file project_file_path

project_root_directory_path = '/Users/travismurdoc/Desktop/Dev/qpay-ios/Qpay/Qpay'
targets_with_pathways = {
  'Qpay-DEV' => '/Users/travismurdoc/Desktop/qpay-ios/Qpay/Qpay',
  'Qpay-PUB' => '/Users/travismurdoc/Desktop/qpay-ios/Qpay/Qpay',
  'QpayTests' => '/Users/travismurdoc/Desktop/qpay-ios/Qpay/QpayTests',
  'QpayAppTests' => '/Users/travismurdoc/Desktop/qpay-ios/Qpay/QpayAppTests',
  'QpayUITests' => '/Users/travismurdoc/Desktop/qpay-ios/Qpay/QpayUITests'
}

pbx_files_finder = PBXFilesFinder.new project_file
physical_files_finder = PhysicalFilesFinder.new(project_root_directory_path, targets_with_pathways)

files_existence_matcher = FilesExistenceMatcher.new(pbx_files_finder, physical_files_finder)
target_files_duplicates_finder = TargetFilesDuplicatesFinder.new
target_files_intersector = TargetFilesIntersector.new

# files_existence_matcher.match_files project_file
# target_files_duplicates_finder.find_duplicates project_file
target_files_intersector.intersect_targets project_file
