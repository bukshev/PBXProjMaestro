# frozen_string_literal: true

module Environment
  TRIMMING_MASK = "\r\t\n "
  TRIMMING_WITHOUT_SPACE_MASK = "\r\t\n"

  GENERAL_TARGETS = %w[Qpay-DEV Qpay-PUB].freeze
  TESTS_TARGETS = %w[QpayTests QpayAppTests QpayUITests].freeze

  BUILD_PHASE_SOURCES_SECTION_NAME = 'Sources'
end
