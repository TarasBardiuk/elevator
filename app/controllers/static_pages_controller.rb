# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home; end
  
  def update_info
    @static_info = StaticInfo.first
  end
end
