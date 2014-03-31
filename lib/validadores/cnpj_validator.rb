require_relative 'cadastro_nacional_validator'

module ActiveModel
  module Validations
    class CnpjValidator < EachValidator
      
      include CadastroNacionalValidator
  
      FORMATO_CNPJ_FORMATADO = /^\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}$/
      FORMATO_CNPJ_CRU = /^\d{14}$/

      def initialize(options)
        super(options)
      end

      def valid?(value)
        formato = if options[:formatado].nil? || options[:formatado]
          FORMATO_CNPJ_FORMATADO
        else
          FORMATO_CNPJ_CRU
        end
        
        if formato =~ value
          digits_string = value.delete('.\-/')
          cnpj_base = digits_string[0...12]
          first_verifying_digit = calculate_first_verifying_digit(cnpj_base)

          new_base = cnpj_base + first_verifying_digit.to_s
          second_verifying_digit = calculate_second_verifying_digit(new_base)
      
          verifying_digits = first_verifying_digit.to_s + second_verifying_digit.to_s
          digits_string[-2..-1] == verifying_digits
        else
          false
        end
      end
  
    private

      def calculate_first_verifying_digit(value)
        weights = (2..9).to_a + (2..5).to_a
        calculate_verifying_digit(value, weights)
      end
  
      def calculate_second_verifying_digit(value)
        weights = (2..9).to_a + (2..6).to_a
        calculate_verifying_digit(value, weights)
      end
    end
  end
end