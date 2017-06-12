# frozen_string_literal: true

class ParamsService
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
