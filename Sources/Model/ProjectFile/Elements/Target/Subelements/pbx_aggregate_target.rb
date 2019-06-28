# frozen_string_literal: true

#
#  pbx_aggregate_target.rb
#  PBXProjMaestro
#
#  Created by Ivan Bukshev on 01/04/2019.
#  Copyright © 2019 Team Absurdum. All rights reserved.
#

# This is the element for a build target that aggregates several others.
class PBXAggregateTarget
  # @!attribute [r] reference
  #   A 96 bits identifier.
  #   @return [UUID]
  attr_reader :reference

  # @!attribute [r] isa
  #   @return [PBXAggregateTarget]
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

  # @!attribute [r] product_name
  #   The product name.
  #   @return [String]
  attr_reader :product_name

  def initialize(reference,
                 isa,
                 build_configuration_list,
                 build_phases,
                 dependencies,
                 name,
                 product_name)

    @reference = reference
    @isa = isa
    @build_configuration_list = build_configuration_list
    @build_phases = build_phases
    @dependencies = dependencies
    @name = name
    @product_name = product_name
  end
end

# Example:
#
# 4DA521A6115A00AF007C19C3 /* documentation */ = {
#     isa = PBXAggregateTarget;
#     buildConfigurationList = 4DA521AE115A00ED007C19C3 /* Build configuration list for PBXAggregateTarget "documentation" */;
#     buildPhases = (
#         4DA521A5115A00AF007C19C3 /* ShellScript */,
#     );
#     dependencies = (
#         4DA521AA115A00BC007C19C3 /* PBXTargetDependency */,
#     );
#     name = documentation;
#     productName = documentation;
# };