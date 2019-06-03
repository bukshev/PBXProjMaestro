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

# This is the element for a build target that
# produces a binary content (application or library).
class PBXProject
  # @!attribute [r] reference
  #   A 96 bits identifier.
  #   @return [UUID]
  attr_reader :reference

  # @!attribute [r] isa
  #   @return [PBXProject]
  attr_reader :isa

  # @!attribute [r] build_configuration_list
  #   An element reference.
  #   The object is a reference to a XCConfigurationList element.
  #   @return [Reference]
  attr_reader :build_configuration_list

  # @!attribute [r] compatibility_version
  #   A string representation of the XcodeCompatibilityVersion.
  #   @return [String]
  attr_reader :compatibility_version

  # @!attribute [r] development_region
  #   The region of development.
  #   @return [String]
  attr_reader :development_region

  # @!attribute [r] has_scanned_for_encodings
  #   Value: 0 or 1
  #   Whether file encodings have been scanned.
  #   @return [Number]
  attr_reader :has_scanned_for_encodings

  # @!attribute [r] known_regions
  #   A list of strings.
  #   The known regions for localized files.
  #   @return [List]
  attr_reader :known_regions

  # @!attribute [r] main_group
  #   An element reference.
  #   The object is a reference to a PBXGroup element.
  #   @return [Reference]
  attr_reader :main_group

  # @!attribute [r] product_ref_group
  #   An element reference.
  #   The object is a reference to a PBXGroup element.
  #   @return [Reference]
  attr_reader :product_ref_group

  # @!attribute [r] project_dir_path
  #   The relative path of the project.
  #   @return [String]
  attr_reader :project_dir_path

  # @!attribute [r] project_references
  #   Each map in the array contains two keys: ProductGroup and ProjectRef.
  #   @return [Array of map]
  attr_reader :project_references

  # @!attribute [r] project_root
  #   The relative root path of the project.
  #   @return [String]
  attr_reader :project_root

  # @!attribute [r] targets
  #   A list of element references.
  #   The objects are a reference to a PBXTarget element.
  #   @return [List]
  attr_reader :targets

  def initialize(reference,
                 isa,
                 build_configuration_list,
                 compatibility_version,
                 development_region,
                 has_scanned_for_encodings,
                 known_regions,
                 main_group,
                 product_ref_group,
                 project_dir_path,
                 project_references,
                 project_root,
                 targets)

    @reference = reference
    @isa = isa
    @build_configuration_list = build_configuration_list
    @compatibility_version = compatibility_version
    @development_region = development_region
    @has_scanned_for_encodings = has_scanned_for_encodings
    @known_regions = known_regions
    @main_group = main_group
    @product_ref_group = product_ref_group
    @project_dir_path = project_dir_path
    @project_references = project_references
    @project_root = project_root
    @targets = targets
  end
end

# Example:
#
# /* Begin PBXProject section */
#     F485BA5722532463006DA0D5 /* Project object */ = {
#       isa = PBXProject;
#       attributes = {
#         LastSwiftUpdateCheck = 1010;
#         LastUpgradeCheck = 1010;
#         ORGANIZATIONNAME = "Team Name";
#         TargetAttributes = {
#           F485BA5E22532463006DA0D5 = {
#             CreatedOnToolsVersion = 10.1;
#           };
#           F485BA7222532465006DA0D5 = {
#             CreatedOnToolsVersion = 10.1;
#             TestTargetID = F485BA5E22532463006DA0D5;
#           };
#           F485BA7D22532465006DA0D5 = {
#             CreatedOnToolsVersion = 10.1;
#             TestTargetID = F485BA5E22532463006DA0D5;
#           };
#         };
#       };
#       buildConfigurationList = F485BA5A22532463006DA0D5 /* Build configuration list for PBXProject "ABCProject" */;
#       compatibilityVersion = "Xcode 9.3";
#       developmentRegion = en;
#       hasScannedForEncodings = 0;
#       knownRegions = (
#         en,
#         Base,
#       );
#       mainGroup = F485BA5622532463006DA0D5;
#       productRefGroup = F485BA6022532463006DA0D5 /* Products */;
#       projectDirPath = "";
#       projectRoot = "";
#       targets = (
#         F485BA5E22532463006DA0D5 /* ABCProject */,
#         F485BA7222532465006DA0D5 /* ABCProjectTests */,
#         F485BA7D22532465006DA0D5 /* ABCProjectUITests */,
#         F485BA9422532498006DA0D5 /* ABCSecondTarget */,
#       );
#     };
# /* End PBXProject section */