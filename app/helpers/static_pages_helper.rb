# frozen_string_literal: true

module StaticPagesHelper
  def admin_name(first_name, last_name)
    ' ' + [first_name, last_name].join(' ')
  end

  def static_info_converter(obj)
    result = {}
    byebug
    # eval(obj.phones).each {|key, value| result.merge{key: value} }
    # do |key, value|
    #   result.merge{key: value}
    # end
    # result
  end
end

class CustomFieldsDecorator
  MODEL_NAME = ActiveModel::Name.new(self.class, nil, 'custom_fields')

  def model_name
    MODEL_NAME
  end

  def initialize(hash)
    @object = hash.symbolize_keys
  end

  # Delegates to the wrapped object
  def method_missing(method, *args, &block)
    if @object.key? method
      @object[method]
    elsif @object.respond_to? method
      @object.send(method, *args, &block)
    end
  end

  def has_attribute? attr
    @object.key? attr
  end
end
