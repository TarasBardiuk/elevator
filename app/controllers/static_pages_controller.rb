# frozen_string_literal: true

class StaticPagesController < ApplicationController
  before_action :find_info, only: %i[edit_info update_info]

  def home; end

  def edit_info; end

  def update_info
    @parameters = ParamsServise.new(params).params
    if @static_info.update_attributes(@parameters)
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

class ParamsServise
  attr_reader :params

  def initialize(incoming_params)
    @incoming_params = incoming_params
    @params = modified_params
  end

  private

  def info_params
    @info_params ||= @incoming_params.require(:static_info)
                                     .permit(:email, :phones
                                               .instance_values['parameters'])
  end

  def modified_params
    info_params[:phones] = @incoming_params[:static_info][:phones]
                           .instance_values['parameters']
    info_params
  end
end
