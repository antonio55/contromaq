# encoding: utf-8

module ActiveModel
  module Validations
    class CnsValidator < EachValidator
      TAMANHO_CNS = 15

      def initialize(options)
        super(options)
      end

      def validate_each(record, attribute, value)
        unless valid?(value)
          record.errors.add(attribute, 'não é válido')
        end
      end

      def valid?(value)
        if value.size == TAMANHO_CNS
          cns_permanente_valido?(value) or cns_provisorio_valido?(value)
        else
          false
        end
      end

    private
      def cns_permanente_valido?(cns)
        pis = cns[0...11]
        soma = calcular_soma(pis)

        dv = calcular_dv(soma)
  
        if dv == 10
          soma += 2
    
          dv = calcular_dv(soma)
          cns == "#{pis}001#{dv}"
        else
          cns == "#{pis}000#{dv}"
        end
      end
      
      def cns_provisorio_valido?(cns)
        pesos = (1..15).to_a.reverse
        soma = cns.split('').sum { |d| d.to_i * pesos.shift }
        
        soma % 11 == 0
      end
    
      def calcular_soma(digitos_string)
        pesos = [15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5]
        soma = digitos_string.split('').sum { |d| d.to_i * pesos.shift }
      end

      def calcular_dv(soma)
        dv = 11 - (soma % 11)
        dv == 11 ? 0 : dv
      end
    end
  end
end