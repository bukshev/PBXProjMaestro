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

# This is the element for defining build configuration.
class XCBuildConfiguration
  # @!attribute [r] reference
  #   A 96 bits identifier.
  #   @return [UUID]
  attr_reader :reference

  # @!attribute [r] isa
  #   @return [XCBuildConfiguration]
  attr_reader :isa

  # @!attribute [r] base_configuration_reference
  #   The path to a xcconfig file.
  #   @return [String]
  attr_reader :base_configuration_reference

  # @!attribute [r] build_settings
  #   A map of build settings.
  #   @return [Map]
  attr_reader :build_settings

  # @!attribute [r] name
  #   The configuration name.
  #   @return [String]
  attr_reader :name

  def initialize(reference,
                 isa,
                 base_configuration_reference,
                 build_settings,
                 name)
    @reference = reference
    @isa = isa
    @base_configuration_reference = base_configuration_reference
    @build_settings = build_settings
    @name = name
  end
end

# Example:
#
# /* Begin XCBuildConfiguration section */
#
#     F485BA8522532465006DA0D5 /* Debug */ = {
#       isa = XCBuildConfiguration;
#       buildSettings = {
#         ALWAYS_SEARCH_USER_PATHS = NO;
#         CLANG_ANALYZER_NONNULL = YES;
#         CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
#         CLANG_CXX_LANGUAGE_STANDARD = "gnu++14";
#         CLANG_CXX_LIBRARY = "libc++";
#         CLANG_ENABLE_MODULES = YES;
#         CLANG_ENABLE_OBJC_ARC = YES;
#         CLANG_ENABLE_OBJC_WEAK = YES;
#         CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
#         CLANG_WARN_BOOL_CONVERSION = YES;
#         CLANG_WARN_COMMA = YES;
#         CLANG_WARN_CONSTANT_CONVERSION = YES;
#         CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
#         CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
#         CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
#         CLANG_WARN_EMPTY_BODY = YES;
#         CLANG_WARN_ENUM_CONVERSION = YES;
#         CLANG_WARN_INFINITE_RECURSION = YES;
#         CLANG_WARN_INT_CONVERSION = YES;
#         CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
#         CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
#         CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
#         CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
#         CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
#         CLANG_WARN_STRICT_PROTOTYPES = YES;
#         CLANG_WARN_SUSPICIOUS_MOVE = YES;
#         CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
#         CLANG_WARN_UNREACHABLE_CODE = YES;
#         CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
#         CODE_SIGN_IDENTITY = "iPhone";
#         COPY_PHASE_STRIP = NO;
#         DEBUG_INFORMATION_FORMAT = dwarf;
#         ENABLE_STRICT_OBJC_MSGSEND = YES;
#         ENABLE_TESTABILITY = YES;
#         GCC_C_LANGUAGE_STANDARD = gnu11;
#         GCC_DYNAMIC_NO_PIC = NO;
#         GCC_NO_COMMON_BLOCKS = YES;
#         GCC_OPTIMIZATION_LEVEL = 0;
#         GCC_PREPROCESSOR_DEFINITIONS = (
#           "DEBUG=1",
#           "$(inherited)",
#         );
#         GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
#         GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
#         GCC_WARN_UNDECLARED_SELECTOR = YES;
#         GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
#         GCC_WARN_UNUSED_FUNCTION = YES;
#         GCC_WARN_UNUSED_VARIABLE = YES;
#         IPHONEOS_DEPLOYMENT_TARGET = 12.1;
#         MTL_ENABLE_DEBUG_INFO = INCLUDE_SOURCE;
#         MTL_FAST_MATH = YES;
#         ONLY_ACTIVE_ARCH = YES;
#         SDKROOT = iphoneos;
#         SWIFT_ACTIVE_COMPILATION_CONDITIONS = DEBUG;
#         SWIFT_OPTIMIZATION_LEVEL = "-Onone";
#       };
#       name = Debug;
#     };
#     F485BA8622532465006DA0D5 /* Release */ = {
#       isa = XCBuildConfiguration;
#       buildSettings = {
#         ALWAYS_SEARCH_USER_PATHS = NO;
#         CLANG_ANALYZER_NONNULL = YES;
#         CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
#         CLANG_CXX_LANGUAGE_STANDARD = "gnu++14";
#         CLANG_CXX_LIBRARY = "libc++";
#         CLANG_ENABLE_MODULES = YES;
#         CLANG_ENABLE_OBJC_ARC = YES;
#         CLANG_ENABLE_OBJC_WEAK = YES;
#         CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
#         CLANG_WARN_BOOL_CONVERSION = YES;
#         CLANG_WARN_COMMA = YES;
#         CLANG_WARN_CONSTANT_CONVERSION = YES;
#         CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
#         CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
#         CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
#         CLANG_WARN_EMPTY_BODY = YES;
#         CLANG_WARN_ENUM_CONVERSION = YES;
#         CLANG_WARN_INFINITE_RECURSION = YES;
#         CLANG_WARN_INT_CONVERSION = YES;
#         CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
#         CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
#         CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
#         CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
#         CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
#         CLANG_WARN_STRICT_PROTOTYPES = YES;
#         CLANG_WARN_SUSPICIOUS_MOVE = YES;
#         CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
#         CLANG_WARN_UNREACHABLE_CODE = YES;
#         CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
#         CODE_SIGN_IDENTITY = "iPhone Developer";
#         COPY_PHASE_STRIP = NO;
#         DEBUG_INFORMATION_FORMAT = "dwarf-with-dsym";
#         ENABLE_NS_ASSERTIONS = NO;
#         ENABLE_STRICT_OBJC_MSGSEND = YES;
#         GCC_C_LANGUAGE_STANDARD = gnu11;
#         GCC_NO_COMMON_BLOCKS = YES;
#         GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
#         GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
#         GCC_WARN_UNDECLARED_SELECTOR = YES;
#         GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
#         GCC_WARN_UNUSED_FUNCTION = YES;
#         GCC_WARN_UNUSED_VARIABLE = YES;
#         IPHONEOS_DEPLOYMENT_TARGET = 12.1;
#         MTL_ENABLE_DEBUG_INFO = NO;
#         MTL_FAST_MATH = YES;
#         SDKROOT = iphoneos;
#         SWIFT_COMPILATION_MODE = wholemodule;
#         SWIFT_OPTIMIZATION_LEVEL = "-O";
#         VALIDATE_PRODUCT = YES;
#       };
#       name = Release;
#     };
#     F485BA8822532465006DA0D5 /* Debug */ = {
#       isa = XCBuildConfiguration;
#       buildSettings = {
#         ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
#         CODE_SIGN_STYLE = Automatic;
#         DEVELOPMENT_TEAM = L2MEX11111;
#         INFOPLIST_FILE = ABCProject/Info.plist;
#         LD_RUNPATH_SEARCH_PATHS = (
#           "$(inherited)",
#           "@executable_path/Frameworks",
#         );
#         PRODUCT_BUNDLE_IDENTIFIER = ios.ABCProject;
#         PRODUCT_NAME = "$(TARGET_NAME)";
#         SWIFT_VERSION = 4.2;
#         TARGETED_DEVICE_FAMILY = "1,2";
#       };
#       name = Debug;
#     };
#     F485BA8922532465006DA0D5 /* Release */ = {
#       isa = XCBuildConfiguration;
#       buildSettings = {
#         ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
#         CODE_SIGN_STYLE = Automatic;
#         DEVELOPMENT_TEAM = L2MEX11111;
#         INFOPLIST_FILE = ABCProject/Info.plist;
#         LD_RUNPATH_SEARCH_PATHS = (
#           "$(inherited)",
#           "@executable_path/Frameworks",
#         );
#         PRODUCT_BUNDLE_IDENTIFIER = ios.ABCProject;
#         PRODUCT_NAME = "$(TARGET_NAME)";
#         SWIFT_VERSION = 4.2;
#         TARGETED_DEVICE_FAMILY = "1,2";
#       };
#       name = Release;
#     };
#     F485BA8B22532465006DA0D5 /* Debug */ = {
#       isa = XCBuildConfiguration;
#       buildSettings = {
#         ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES = YES;
#         BUNDLE_LOADER = "$(TEST_HOST)";
#         CODE_SIGN_STYLE = Automatic;
#         DEVELOPMENT_TEAM = L2MEX11111;
#         INFOPLIST_FILE = ABCProjectTests/Info.plist;
#         LD_RUNPATH_SEARCH_PATHS = (
#           "$(inherited)",
#           "@executable_path/Frameworks",
#           "@loader_path/Frameworks",
#         );
#         PRODUCT_BUNDLE_IDENTIFIER = ios.ABCProjectTests;
#         PRODUCT_NAME = "$(TARGET_NAME)";
#         SWIFT_VERSION = 4.2;
#         TARGETED_DEVICE_FAMILY = "1,2";
#         TEST_HOST = "$(BUILT_PRODUCTS_DIR)/ABCProject.app/ABCProject";
#       };
#       name = Debug;
#     };
#     F485BA8C22532465006DA0D5 /* Release */ = {
#       isa = XCBuildConfiguration;
#       buildSettings = {
#         ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES = YES;
#         BUNDLE_LOADER = "$(TEST_HOST)";
#         CODE_SIGN_STYLE = Automatic;
#         DEVELOPMENT_TEAM = L2MEX11111;
#         INFOPLIST_FILE = ABCProjectTests/Info.plist;
#         LD_RUNPATH_SEARCH_PATHS = (
#           "$(inherited)",
#           "@executable_path/Frameworks",
#           "@loader_path/Frameworks",
#         );
#         PRODUCT_BUNDLE_IDENTIFIER = ios.ABCProjectTests;
#         PRODUCT_NAME = "$(TARGET_NAME)";
#         SWIFT_VERSION = 4.2;
#         TARGETED_DEVICE_FAMILY = "1,2";
#         TEST_HOST = "$(BUILT_PRODUCTS_DIR)/ABCProject.app/ABCProject";
#       };
#       name = Release;
#     };
#     F485BA8E22532465006DA0D5 /* Debug */ = {
#       isa = XCBuildConfiguration;
#       buildSettings = {
#         ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES = YES;
#         CODE_SIGN_STYLE = Automatic;
#         DEVELOPMENT_TEAM = L2MEX11111;
#         INFOPLIST_FILE = ABCProjectUITests/Info.plist;
#         LD_RUNPATH_SEARCH_PATHS = (
#           "$(inherited)",
#           "@executable_path/Frameworks",
#           "@loader_path/Frameworks",
#         );
#         PRODUCT_BUNDLE_IDENTIFIER = ios.ABCProjectUITests;
#         PRODUCT_NAME = "$(TARGET_NAME)";
#         SWIFT_VERSION = 4.2;
#         TARGETED_DEVICE_FAMILY = "1,2";
#         TEST_TARGET_NAME = ABCProject;
#       };
#       name = Debug;
#     };
#     F485BA8F22532465006DA0D5 /* Release */ = {
#       isa = XCBuildConfiguration;
#       buildSettings = {
#         ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES = YES;
#         CODE_SIGN_STYLE = Automatic;
#         DEVELOPMENT_TEAM = L2MEX11111;
#         INFOPLIST_FILE = ABCProjectUITests/Info.plist;
#         LD_RUNPATH_SEARCH_PATHS = (
#           "$(inherited)",
#           "@executable_path/Frameworks",
#           "@loader_path/Frameworks",
#         );
#         PRODUCT_BUNDLE_IDENTIFIER = ios.ABCProjectUITests;
#         PRODUCT_NAME = "$(TARGET_NAME)";
#         SWIFT_VERSION = 4.2;
#         TARGETED_DEVICE_FAMILY = "1,2";
#         TEST_TARGET_NAME = ABCProject;
#       };
#       name = Release;
#     };
#     F485BA9022532472006DA0D5 /* Debug2 */ = {
#       isa = XCBuildConfiguration;
#       buildSettings = {
#         ALWAYS_SEARCH_USER_PATHS = NO;
#         CLANG_ANALYZER_NONNULL = YES;
#         CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
#         CLANG_CXX_LANGUAGE_STANDARD = "gnu++14";
#         CLANG_CXX_LIBRARY = "libc++";
#         CLANG_ENABLE_MODULES = YES;
#         CLANG_ENABLE_OBJC_ARC = YES;
#         CLANG_ENABLE_OBJC_WEAK = YES;
#         CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
#         CLANG_WARN_BOOL_CONVERSION = YES;
#         CLANG_WARN_COMMA = YES;
#         CLANG_WARN_CONSTANT_CONVERSION = YES;
#         CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
#         CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
#         CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
#         CLANG_WARN_EMPTY_BODY = YES;
#         CLANG_WARN_ENUM_CONVERSION = YES;
#         CLANG_WARN_INFINITE_RECURSION = YES;
#         CLANG_WARN_INT_CONVERSION = YES;
#         CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
#         CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
#         CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
#         CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
#         CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
#         CLANG_WARN_STRICT_PROTOTYPES = YES;
#         CLANG_WARN_SUSPICIOUS_MOVE = YES;
#         CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
#         CLANG_WARN_UNREACHABLE_CODE = YES;
#         CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
#         CODE_SIGN_IDENTITY = "iPhone Developer";
#         COPY_PHASE_STRIP = NO;
#         DEBUG_INFORMATION_FORMAT = dwarf;
#         ENABLE_STRICT_OBJC_MSGSEND = YES;
#         ENABLE_TESTABILITY = YES;
#         GCC_C_LANGUAGE_STANDARD = gnu11;
#         GCC_DYNAMIC_NO_PIC = NO;
#         GCC_NO_COMMON_BLOCKS = YES;
#         GCC_OPTIMIZATION_LEVEL = 0;
#         GCC_PREPROCESSOR_DEFINITIONS = (
#           "DEBUG=1",
#           "$(inherited)",
#         );
#         GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
#         GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
#         GCC_WARN_UNDECLARED_SELECTOR = YES;
#         GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
#         GCC_WARN_UNUSED_FUNCTION = YES;
#         GCC_WARN_UNUSED_VARIABLE = YES;
#         IPHONEOS_DEPLOYMENT_TARGET = 12.1;
#         MTL_ENABLE_DEBUG_INFO = INCLUDE_SOURCE;
#         MTL_FAST_MATH = YES;
#         ONLY_ACTIVE_ARCH = YES;
#         SDKROOT = iphoneos;
#         SWIFT_ACTIVE_COMPILATION_CONDITIONS = DEBUG;
#         SWIFT_OPTIMIZATION_LEVEL = "-Onone";
#       };
#       name = Debug2;
#     };
#     F485BA9122532472006DA0D5 /* Debug2 */ = {
#       isa = XCBuildConfiguration;
#       buildSettings = {
#         ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
#         CODE_SIGN_STYLE = Automatic;
#         DEVELOPMENT_TEAM = L2MEX11111;
#         INFOPLIST_FILE = ABCProject/Info.plist;
#         LD_RUNPATH_SEARCH_PATHS = (
#           "$(inherited)",
#           "@executable_path/Frameworks",
#         );
#         PRODUCT_BUNDLE_IDENTIFIER = ios.ABCProject;
#         PRODUCT_NAME = "$(TARGET_NAME)";
#         SWIFT_VERSION = 4.2;
#         TARGETED_DEVICE_FAMILY = "1,2";
#       };
#       name = Debug2;
#     };
#     F485BA9222532472006DA0D5 /* Debug2 */ = {
#       isa = XCBuildConfiguration;
#       buildSettings = {
#         ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES = YES;
#         BUNDLE_LOADER = "$(TEST_HOST)";
#         CODE_SIGN_STYLE = Automatic;
#         DEVELOPMENT_TEAM = L2MEX11111;
#         INFOPLIST_FILE = ABCProjectTests/Info.plist;
#         LD_RUNPATH_SEARCH_PATHS = (
#           "$(inherited)",
#           "@executable_path/Frameworks",
#           "@loader_path/Frameworks",
#         );
#         PRODUCT_BUNDLE_IDENTIFIER = ios.ABCProjectTests;
#         PRODUCT_NAME = "$(TARGET_NAME)";
#         SWIFT_VERSION = 4.2;
#         TARGETED_DEVICE_FAMILY = "1,2";
#         TEST_HOST = "$(BUILT_PRODUCTS_DIR)/ABCProject.app/ABCProject";
#       };
#       name = Debug2;
#     };
#     F485BA9322532472006DA0D5 /* Debug2 */ = {
#       isa = XCBuildConfiguration;
#       buildSettings = {
#         ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES = YES;
#         CODE_SIGN_STYLE = Automatic;
#         DEVELOPMENT_TEAM = L2MEX11111;
#         INFOPLIST_FILE = ABCProjectUITests/Info.plist;
#         LD_RUNPATH_SEARCH_PATHS = (
#           "$(inherited)",
#           "@executable_path/Frameworks",
#           "@loader_path/Frameworks",
#         );
#         PRODUCT_BUNDLE_IDENTIFIER = ios.ABCProjectUITests;
#         PRODUCT_NAME = "$(TARGET_NAME)";
#         SWIFT_VERSION = 4.2;
#         TARGETED_DEVICE_FAMILY = "1,2";
#         TEST_TARGET_NAME = ABCProject;
#       };
#       name = Debug2;
#     };
#     F485BA9E22532498006DA0D5 /* Debug */ = {
#       isa = XCBuildConfiguration;
#       buildSettings = {
#         ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
#         CODE_SIGN_STYLE = Automatic;
#         DEVELOPMENT_TEAM = L2MEX11111;
#         INFOPLIST_FILE = "ABCProject copy-Info.plist";
#         LD_RUNPATH_SEARCH_PATHS = (
#           "$(inherited)",
#           "@executable_path/Frameworks",
#         );
#         PRODUCT_BUNDLE_IDENTIFIER = ios.ABCProject;
#         PRODUCT_NAME = "$(TARGET_NAME)";
#         SWIFT_VERSION = 4.2;
#         TARGETED_DEVICE_FAMILY = "1,2";
#       };
#       name = Debug;
#     };
#     F485BA9F22532498006DA0D5 /* Debug2 */ = {
#       isa = XCBuildConfiguration;
#       buildSettings = {
#         ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
#         CODE_SIGN_STYLE = Automatic;
#         DEVELOPMENT_TEAM = L2MEX11111;
#         INFOPLIST_FILE = "ABCProject copy-Info.plist";
#         LD_RUNPATH_SEARCH_PATHS = (
#           "$(inherited)",
#           "@executable_path/Frameworks",
#         );
#         PRODUCT_BUNDLE_IDENTIFIER = ios.ABCProject;
#         PRODUCT_NAME = "$(TARGET_NAME)";
#         SWIFT_VERSION = 4.2;
#         TARGETED_DEVICE_FAMILY = "1,2";
#       };
#       name = Debug2;
#     };
#     F485BAA022532498006DA0D5 /* Release */ = {
#       isa = XCBuildConfiguration;
#       buildSettings = {
#         ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
#         CODE_SIGN_STYLE = Automatic;
#         DEVELOPMENT_TEAM = L2MEX11111;
#         INFOPLIST_FILE = "ABCProject copy-Info.plist";
#         LD_RUNPATH_SEARCH_PATHS = (
#           "$(inherited)",
#           "@executable_path/Frameworks",
#         );
#         PRODUCT_BUNDLE_IDENTIFIER = ios.ABCProject;
#         PRODUCT_NAME = "$(TARGET_NAME)";
#         SWIFT_VERSION = 4.2;
#         TARGETED_DEVICE_FAMILY = "1,2";
#       };
#       name = Release;
#     };
#
# /* End XCBuildConfiguration section */