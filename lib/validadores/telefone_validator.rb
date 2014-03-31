require 'active_model/validations/format'

module ActiveModel
  module Validations
    class TelefoneValidator < FormatValidator
      def initialize(options)
        options[:with] = /^\(\d{2}\) \d{4}-\d{4}$/
        super(options)
      end
    end
  end
end