require_relative 'cadastro_nacional_validator'

module ActiveModel
  module Validations
    class CpfValidator < EachValidator
      
      include CadastroNacionalValidator
      
      FORMATO_CPF_FORMATADO = /^\d{3}\.\d{3}\.\d{3}-\d{2}$/
      FORMATO_CPF_CRU = /^\d{11}$/
  
      def initialize(options)
        super(options)
      end
  
      def valid?(value)
        formato = if options[:formatado].nil? || options[:formatado]
          FORMATO_CPF_FORMATADO
        else
          FORMATO_CPF_CRU
        end
        
        if formato =~ value
          digits_string = value.delete('.\-')

          cpf_base = digits_string[0...9]
          first_verifying_digit = calculate_first_verifying_digit(cpf_base)

          new_base = cpf_base + first_verifying_digit.to_s
          second_verifying_digit = calculate_second_verifying_digit(new_base)
      
          verifying_digits = first_verifying_digit.to_s + second_verifying_digit.to_s
      
          digits_string[-2..-1] == verifying_digits
        else
          false
        end
      end
  
    private

      def calculate_first_verifying_digit(value)
        calculate_verifying_digit(value, (2..10).to_a)
      end
  
      def calculate_second_verifying_digit(value)
        calculate_verifying_digit(value, (2..11).to_a)
      end
    end
  end
end