module ActiveModel
  module Validations
    class EmailValidator < FormatValidator
      def initialize(options)
        options[:with] = /^[^ @]+@[^ @]+(\.[^ @]+)+$/
        super(options)
      end
    end
  end
end