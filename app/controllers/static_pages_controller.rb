# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    render html: 'hello, world!'
  end
end
