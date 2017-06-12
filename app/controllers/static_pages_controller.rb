# frozen_string_literal: true

class StaticPagesController < ApplicationController
  before_action :find_info, only: %i[edit_info update_info]
  before_action :authenticate_admin!, only: %i[edit_info update_info]

  def home; end

  def edit_info; end

  def update_info
    parameters = ParamsService.new(params).params
    if @static_info.update_attributes(parameters)
      redirect_to root_path, notice: 'Інформацію успішно оновлено!'
    else
      render 'edit_info'
    end
  end

  private

  def find_info
    @static_info = StaticInfo.first
  end
end
