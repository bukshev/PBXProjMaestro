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

# This is the element for listing build configurations.
class XCConfigurationList
  # @!attribute [r] reference
  #   A 96 bits identifier.
  #   @return [UUID]
  attr_reader :reference

  # @!attribute [r] isa
  #   @return [XCConfigurationList]
  attr_reader :isa

  # @!attribute [r] build_configurations
  #   A list of element references.
  #   The objects are a reference to a XCBuildConfiguration element.
  #   @return [List]
  attr_reader :build_configurations

  # @!attribute [r] default_configuration_is_visible
  #   Default value: 0
  #   @return [Number]
  attr_reader :default_configuration_is_visible

  # @!attribute [r] default_configuration_name
  #   The default configuration name.
  #   @return [String]
  attr_reader :default_configuration_name

  def initialize(reference,
                 isa,
                 build_configurations,
                 default_configuration_is_visible,
                 default_configuration_name)

    @reference = reference
    @isa = isa
    @build_configurations = build_configurations
    @default_configuration_is_visible = default_configuration_is_visible
    @default_configuration_name = default_configuration_name
  end
end

# Example:
#
# /* Begin XCConfigurationList section */
#
#     F485BA5A22532463006DA0D5 /* Build configuration list for PBXProject "ABCProject" */ = {
#       isa = XCConfigurationList;
#       buildConfigurations = (
#         F485BA8522532465006DA0D5 /* Debug */,
#         F485BA9022532472006DA0D5 /* Debug2 */,
#         F485BA8622532465006DA0D5 /* Release */,
#       );
#       defaultConfigurationIsVisible = 0;
#       defaultConfigurationName = Release;
#     };
#     F485BA8722532465006DA0D5 /* Build configuration list for PBXNativeTarget "ABCProject" */ = {
#       isa = XCConfigurationList;
#       buildConfigurations = (
#         F485BA8822532465006DA0D5 /* Debug */,
#         F485BA9122532472006DA0D5 /* Debug2 */,
#         F485BA8922532465006DA0D5 /* Release */,
#       );
#       defaultConfigurationIsVisible = 0;
#       defaultConfigurationName = Release;
#     };
#     F485BA8A22532465006DA0D5 /* Build configuration list for PBXNativeTarget "ABCProjectTests" */ = {
#       isa = XCConfigurationList;
#       buildConfigurations = (
#         F485BA8B22532465006DA0D5 /* Debug */,
#         F485BA9222532472006DA0D5 /* Debug2 */,
#         F485BA8C22532465006DA0D5 /* Release */,
#       );
#       defaultConfigurationIsVisible = 0;
#       defaultConfigurationName = Release;
#     };
#     F485BA8D22532465006DA0D5 /* Build configuration list for PBXNativeTarget "ABCProjectUITests" */ = {
#       isa = XCConfigurationList;
#       buildConfigurations = (
#         F485BA8E22532465006DA0D5 /* Debug */,
#         F485BA9322532472006DA0D5 /* Debug2 */,
#         F485BA8F22532465006DA0D5 /* Release */,
#       );
#       defaultConfigurationIsVisible = 0;
#       defaultConfigurationName = Release;
#     };
#     F485BA9D22532498006DA0D5 /* Build configuration list for PBXNativeTarget "ABCSecondTarget" */ = {
#       isa = XCConfigurationList;
#       buildConfigurations = (
#         F485BA9E22532498006DA0D5 /* Debug */,
#         F485BA9F22532498006DA0D5 /* Debug2 */,
#         F485BAA022532498006DA0D5 /* Release */,
#       );
#       defaultConfigurationIsVisible = 0;
#       defaultConfigurationName = Release;
#     };
#
# /* End XCConfigurationList section */