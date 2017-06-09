# frozen_string_literal: true

class HashValidator < ActiveModel::EachValidator
  REGEXP_SERVISE = /\A[[:alnum:] ]{5,20}$/
  REGEXP_PHONE   = /\A[ x0-9\+\(\)\-\.]{,20}$/

  def validate_each(record, attribute, value)
    value.each do |key, val|
      if key.empty?
        record.errors.add(attribute, 'не може бути пустим')
      elsif key !~ REGEXP_SERVISE
        record.errors.add(key, 'може бути довжиною від 5 до 20 символів і
                                містити тільки букви, цифри і пробіл')
      elsif val !~ REGEXP_PHONE
        record.errors.add(val, 'може бути пустим або довжиною до 20 символів і
                                має відповідати заданому формату')
      end
    end
  end
end
