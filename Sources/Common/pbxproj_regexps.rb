# frozen_string_literal: true

module PBXRegexp
  SINGLE_ELEMENT_SUBSECTION = '(.*[A-Z0-9]{1,})\s\/\*\s([A-Za-z0-9.\s-]{1,})\s\*\/.=.\{(.*(\n.*[;,\(]){1,})'
  SINGLE_ELEMENT_INLINE_SUBSECTION = '([A-Z0-9]{1,})\s\/\*\s([A-Za-z0-9.\s-]{1,})\s\*\/.=.\{(.*([;,\(]){1,})'

  ISA = 'isa\s=\s([A-Za-z]{1,})'
  BUILD_ACTION_MASK = 'buildActionMask\s=\s([0-9]{1,})'
  DST_PATH = 'dstPath\s=\s"([0-9A-Za-z/]{0,})"'
  DST_SUBFOLDER_SPEC = 'dstSubfolderSpec\s=\s([0-9]{1,})'
  NAME = 'name\s=\s"([A-Za-z0-9\s]{1,})";'
  RUN_ONLY_FOR_DEPLOYMENT_POSTPROCESSING = 'runOnlyForDeploymentPostprocessing\s=\s([0|1]);'

  FILES_LIST = 'files\s=\s\((\n.*,){1,}\n.*\);'
  CHILDREN_LIST = 'children\s=\s\((\n.*,){1,}\n.*\);'
  BUILD_PHASES = 'buildPhases\s=\s\((\n.*,){1,}\n.*\);'
  BUILD_RULES = 'buildRules\s=\s\((\n.*,){1,}\n.*\);'
  DEPENDENCIES = 'dependencies\s=\s\((\n.*,){1,}\n.*\);'
  LIST_FILE_REFERENCE = '.*.([A-Z0-9]{1,})\s\/\*\s([A-Za-z0-9._+]{1,})\sin\s([A-Za-z0-9._+ ]{1,})\s\*\/,'
  CHILDREN_LIST_FILE = '.*.([A-Z0-9]{1,})\s\/\*\s([A-Za-z0-9._+]{1,})\s\*\/'
  TARGET_LIST_FILE = '([A-Z0-9]{1,})\s\/\*\s([A-Za-z0-9._+ ]{1,})\s\*\/'

  # PBXFileReference
  EXPLICIT_FILE_TYPE = 'explicitFileType\s=\s([A-Za-z_./]{1,})'
  LAST_KNOWN_FILE_TYPE = 'lastKnownFileType\s=\s([A-Za-z_./]{1,})'
  INCLUDE_IN_INDEX = 'includeInIndex\s=\s([0-9]{1,})'
  PATH = 'path\s=\s([0-9A-Za-z_./"\s-]{1,})'
  SOURCE_TREE = 'sourceTree\s=\s([^;]{1,})'

  # PBXNativeTarget
  BUILD_CONFIGURATION_LIST = 'buildConfigurationList\s=\s([A-Z0-9]{1,})'
  PRODUCT_NAME = 'productName\s=\s([A-Za-z0-9]{1,});'
  PRODUCT_REFERENCE = 'productReference\s=\s([A-Za-z0-9]{1,})'
  PRODUCT_TYPE = 'productType\s=\s"([A-Za-z0-9.-]{1,})";'
end
