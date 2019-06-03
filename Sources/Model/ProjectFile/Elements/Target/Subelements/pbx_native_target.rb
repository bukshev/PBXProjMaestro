# frozen_string_literal: true

#
#  pbx_native_target.rb
#  PBXProjOptimizer
#
#  Created by Ivan Bukshev on 01/04/2019.
#  Copyright © 2019 Team Absurdum. All rights reserved.
#

# This is the element for a build target
# that produces a binary content (application or library).
class PBXNativeTarget
  # @!attribute [r] reference
  #   A 96 bits identifier.
  #   @return [UUID]
  attr_reader :reference

  # @!attribute [r] isa
  #   @return [PBXNativeTarget]
  attr_reader :isa

  # @!attribute [r] build_configuration_list
  #   An element reference.
  #   The object is a reference to a XCConfigurationList element.
  #   @return [Reference]
  attr_reader :build_configuration_list

  # @!attribute [r] build_phases
  #   A list of element reference.
  #   The objects are a reference to a PBXBuildPhase element.
  #   @return [List]
  attr_reader :build_phases

  # @!attribute [r] dependencies
  #   A list of element reference.
  #   The objects are a reference to a PBXTargetDependency element.
  #   @return [List]
  attr_reader :dependencies

  # @!attribute [r] name
  #   The name of the target.
  #   @return [String]
  attr_reader :name

  # @!attribute [r] product_install_path
  #   The product install path.
  #   @return [String]
  attr_reader :product_install_path

  # @!attribute [r] product_name
  #   The product name.
  #   @return [String]
  attr_reader :product_name

  # @!attribute [r] product_reference
  #   An element reference.
  #   The object is a reference to a PBXFileReference element.
  #   @return [Reference]
  attr_reader :product_reference

  # @!attribute [r] product_type
  #   See the PBXProductType enumeration.
  #   @return [String]
  attr_reader :product_type

  def initialize(reference,
                 isa,
                 build_configuration_list,
                 build_phases,
                 dependencies,
                 name,
                 product_install_path,
                 product_name,
                 product_reference,
                 product_type)

    @reference = reference
    @isa = isa
    @build_configuration_list = build_configuration_list
    @build_phases = build_phases
    @dependencies = dependencies
    @name = name
    @product_install_path = product_install_path
    @product_name = product_name
    @product_reference = product_reference
    @product_type = product_type
  end
end

# Example:
#
# /* Begin PBXNativeTarget section */
#
#     F485BA5E22532463006DA0D5 /* ABCProject */ = {
#       isa = PBXNativeTarget;
#       buildConfigurationList = F485BA8722532465006DA0D5 /* Build configuration list for PBXNativeTarget "ABCProject" */;
#       buildPhases = (
#         F485BA5B22532463006DA0D5 /* Sources */,
#         F485BA5C22532463006DA0D5 /* Frameworks */,
#         F485BA5D22532463006DA0D5 /* Resources */,
#       );
#       buildRules = (
#       );
#       dependencies = (
#       );
#       name = ABCProject;
#       productName = ABCProject;
#       productReference = F485BA5F22532463006DA0D5 /* ABCProject.app */;
#       productType = "com.apple.product-type.application";
#     };
#     F485BA7222532465006DA0D5 /* ABCProjectTests */ = {
#       isa = PBXNativeTarget;
#       buildConfigurationList = F485BA8A22532465006DA0D5 /* Build configuration list for PBXNativeTarget "ABCProjectTests" */;
#       buildPhases = (
#         F485BA6F22532465006DA0D5 /* Sources */,
#         F485BA7022532465006DA0D5 /* Frameworks */,
#         F485BA7122532465006DA0D5 /* Resources */,
#       );
#       buildRules = (
#       );
#       dependencies = (
#         F485BA7522532465006DA0D5 /* PBXTargetDependency */,
#       );
#       name = ABCProjectTests;
#       productName = ABCProjectTests;
#       productReference = F485BA7322532465006DA0D5 /* ABCProjectTests.xctest */;
#       productType = "com.apple.product-type.bundle.unit-test";
#     };
#     F485BA7D22532465006DA0D5 /* ABCProjectUITests */ = {
#       isa = PBXNativeTarget;
#       buildConfigurationList = F485BA8D22532465006DA0D5 /* Build configuration list for PBXNativeTarget "ABCProjectUITests" */;
#       buildPhases = (
#         F485BA7A22532465006DA0D5 /* Sources */,
#         F485BA7B22532465006DA0D5 /* Frameworks */,
#         F485BA7C22532465006DA0D5 /* Resources */,
#       );
#       buildRules = (
#       );
#       dependencies = (
#         F485BA8022532465006DA0D5 /* PBXTargetDependency */,
#       );
#       name = ABCProjectUITests;
#       productName = ABCProjectUITests;
#       productReference = F485BA7E22532465006DA0D5 /* ABCProjectUITests.xctest */;
#       productType = "com.apple.product-type.bundle.ui-testing";
#     };
#     F485BA9422532498006DA0D5 /* ABCSecondTarget */ = {
#       isa = PBXNativeTarget;
#       buildConfigurationList = F485BA9D22532498006DA0D5 /* Build configuration list for PBXNativeTarget "ABCSecondTarget" */;
#       buildPhases = (
#         F485BA9522532498006DA0D5 /* Sources */,
#         F485BA9822532498006DA0D5 /* Frameworks */,
#         F485BA9922532498006DA0D5 /* Resources */,
#       );
#       buildRules = (
#       );
#       dependencies = (
#       );
#       name = ABCSecondTarget;
#       productName = ABCProject;
#       productReference = F485BAA122532498006DA0D5 /* ABCSecondTarget.app */;
#       productType = "com.apple.product-type.application";
#     };
#
# /* End PBXNativeTarget section */