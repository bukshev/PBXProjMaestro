# frozen_string_literal: true

module MaestroRegexp
  SINGLE_ELEMENT_SUBSECTION = '(.*[A-Z0-9]{1,})\s\/\*\s([A-Za-z0-9.\s]{1,})\s\*\/.=.\{(.*(\n.*[;,\(]){1,})'

  ISA_LINE = 'isa\s=\s([A-Za-z]{1,})'
  BUILD_ACTION_MASK = 'buildActionMask\s=\s([0-9]{1,})'
  DST_PATH = 'dstPath\s=\s"([0-9A-Za-z/]{0,})"'
  DST_SUBFOLDER_SPEC = 'dstSubfolderSpec\s=\s([0-9]{1,})'
  # FILES_LIST = "files\s=\s\((\n#{@reference_with_comment},){1,}\n.*\);"
  NAME = 'name\s=\s"([A-Za-z0-9\s]{1,})";'
  RUN_ONLY_FOR_DEPLOYMENT_POSTPROCESSING = 'runOnlyForDeploymentPostprocessing\s=\s([0|1]);'

  FILES_LIST = 'files\s=\s\((\n.*,){1,}\n.*\);'
  LIST_FILE_REFERENCE = '.*.([A-Z0-9]{1,})\s\/\*\s([A-Za-z0-9._+]{1,})\sin\s([A-Za-z0-9._+ ]{1,})\s\*\/,'

  # TODO: Should be private
  @reference_with_comment = '.*([A-Z0-9]{1,})\s\/\*\s([A-Za-z0-9.\s]{1,})\s\*\/'

  # SECTION_REFERENCE_WITH_COMMENT = "#{@reference_with_comment}.=.\{"

end