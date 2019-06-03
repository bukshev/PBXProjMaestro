# frozen_string_literal: true

# TODO: Remove all personal identifiers from comments.

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

# Model for .pbxproj file content.
#
# Root Element
# PBXBuildFile
# PBXBuildPhase
# -- PBXAppleScriptBuildPhase
# -- PBXCopyFilesBuildPhase
# -- PBXFrameworksBuildPhase
# -- PBXHeadersBuildPhase
# -- PBXResourcesBuildPhase
# -- PBXShellScriptBuildPhase
# -- PBXSourcesBuildPhase
# PBXContainerItemProxy
# PBXFileElement
# -- PBXFileReference
# -- PBXGroup
# -- PBXVariantGroup
# PBXTarget
# -- PBXAggregateTarget
# -- PBXLegacyTarget
# -- PBXNativeTarget
# PBXProject
# PBXTargetDependency
# XCBuildConfiguration
# XCConfigurationList
#
class ProjectFile
  # @!attribute [r] root_element
  #   @return [RootElement]
  attr_reader :root_element

  # @!attribute [r] build_files
  #   @return [List of PBXBuildFile]
  attr_reader :build_files

  # @!attribute [r] build_phase
  #   @return [PBXBuildPhase]
  attr_reader :build_phase

  # @!attribute [r] container_item_proxies
  #   @return [List of PBXContainerItemProxy]
  attr_reader :container_item_proxies

  # @!attribute [r] file_element
  #   @return [PBXFileElement]
  attr_reader :file_element

  # @!attribute [r] target
  #   @return [PBXTarget]
  attr_reader :target

  # @!attribute [r] project
  #   @return [PBXProject]
  attr_reader :project

  # @!attribute [r] target_dependencies
  #   @return [List of PBXTargetDependency]
  attr_reader :target_dependencies

  # @!attribute [r] xc_build_configurations
  #   @return [List of XCBuildConfiguration]
  attr_reader :xc_build_configurations

  # @!attribute [r] xc_configuration_lists
  #   @return [List of XCConfigurationList]
  attr_reader :xc_configuration_lists

  def initialize(root_element,
                 build_files,
                 build_phase,
                 container_item_proxies,
                 file_element,
                 target,
                 project,
                 target_dependencies,
                 xc_build_configurations,
                 xc_configuration_lists)

    @root_element = root_element
    @build_files = build_files
    @build_phase = build_phase
    @container_item_proxies = container_item_proxies
    @file_element = file_element
    @target = target
    @project = project
    @target_dependencies = target_dependencies
    @xc_build_configurations = xc_build_configurations
    @xc_configuration_lists = xc_configuration_lists
  end
end