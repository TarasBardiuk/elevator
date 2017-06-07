# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :prepare_meta_tags, if: -> { request.get? }

  protected

  def configure_permitted_parameters
    update_attrs = %i[email first_name last_name]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  private

  def prepare_meta_tags(options = {})
    site_name   = 'UNICAR'
    description = 'Ліфти для інвалідів, вертикальні підіймачі,
      підвісні пристрої, акумуляторні сходолази, вантажні платформи.
      Європейська гарантія якості!'
    keywords    = 'UNICAR, УНІКАР, UNICAR-AUTO, УНІКАР-Авто, крісло-платформа,
      інвалідний ліфт, інвалідна платформа, підіймач, підвісний пристрій,
      сходолаз, вантажна платформа, вантажний ліфт'
    defaults = { site: site_name, description: description, keywords: keywords }
    options.reverse_merge!(defaults)
    set_meta_tags options
  end
end
