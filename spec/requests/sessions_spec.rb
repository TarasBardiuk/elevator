# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions' do
  let(:admin) { create(:admin) }

  before(:each) do
    sign_in admin
  end

  it 'signs admin in' do
    get root_path
    expect(controller.current_admin).to eq(admin)
  end

  it 'signs admin out' do
    sign_out admin
    get root_path
    expect(controller.current_admin).to be_nil
  end
end
