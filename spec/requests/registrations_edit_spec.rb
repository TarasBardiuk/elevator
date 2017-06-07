# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Edit registration' do
  let(:admin) { create(:admin) }

  describe 'GET #edit' do
    it 'responds unsuccessfully for guest and redirects to sign_in' do
      get edit_admin_registration_path
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_admin_session_path)
    end

    it 'responds successfully for admin and renders template :edit' do
      sign_in admin
      get edit_admin_registration_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    let(:attributes) do
      FactoryGirl.attributes_for(:admin, email: Faker::Internet.email,
                                         first_name: Faker::Name.first_name,
                                         last_name: Faker::Name.last_name,
                                         current_password: admin.password)
    end

    it 'changes admin attributes' do
      sign_in admin
      patch admin_registration_path, params: { admin: attributes }
      admin.reload
      expect(admin.email).to eql attributes[:email]
      expect(admin.first_name).to eql attributes[:first_name]
      expect(admin.last_name).to eql attributes[:last_name]
    end
  end
end
