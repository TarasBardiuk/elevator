# frozen_string_literal: true

module StaticPagesHelper
  def admin_name(first_name, last_name)
    ' ' + [first_name, last_name].join(' ')
  end
end

class CustomFieldsDecorator
  MODEL_NAME = ActiveModel::Name.new(self.class, nil, 'phones')

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
    else
      super
    end
  end

  def respond_to_missing?(*methods)
    super
  end

  def attribute?(attr)
    @object.key? attr
  end
end
