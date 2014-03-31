# encoding: utf-8

module ActiveModel
  module Validations
    class CepValidator < EachValidator
      FORMATO_CEP = /\d{5}-\d{3}/

      def initialize(options)
        super(options)
      end

      def validate_each(record, attribute, value)
        unless valid?(value)
          record.errors[attribute] = 'não é válido'
        end
      end

      def valid?(value)
       FORMATO_CEP =~ value
      end
    end
  end
end