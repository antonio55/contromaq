# encoding: utf-8

module CadastroNacionalValidator
  def validate_each(record, attribute, value)
    unless self.valid?(value)
      record.errors[attribute] = 'não é válido'
    end
  end

  def calculate_verifying_digit(value, weights)
    sum = 0
    value.scan(/\d/) do |number|
      number = number.to_i
      sum += number * weights.pop
    end

    if sum % 11 < 2
      0
    else
      11 - (sum % 11)
    end
  end
end