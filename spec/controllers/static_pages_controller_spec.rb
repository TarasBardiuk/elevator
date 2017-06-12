# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  let(:admin) { create(:admin) }

  describe 'GET #home' do
    subject { get :home }

    it 'responds successfully with an HTTP 200 status code' do
      expect(subject).to be_success
      expect(subject).to have_http_status(200)
    end

    it 'responds successfully for admin' do
      sign_in admin
      expect(subject).to be_success
      expect(subject).to have_http_status(200)
    end

    it 'renders the home template' do
      expect(subject).to render_template('home')
    end
  end

  describe 'GET #edit_info' do
    subject { get :edit_info }

    it 'responds unsuccessfully for guest and redirects to sign_in' do
      expect(subject).to have_http_status(302)
      expect(subject).to redirect_to(new_admin_session_path)
    end

    it 'responds successfully for admin' do
      sign_in admin
      expect(subject).to be_success
      expect(subject).to have_http_status(200)
    end

    it 'renders the edit_info template' do
      sign_in admin
      expect(subject).to render_template('edit_info')
    end
  end

  describe 'PATCH #update_info' do
    let!(:info) { create(:static_info) }
    let(:attributes) do
      FactoryGirl.attributes_for(:static_info,
                                 email: 'new@email.com',
                                 phones: {
                                   'Служба підтримки':
                                       Faker::PhoneNumber.cell_phone,
                                   'Відділ продажу':
                                       Faker::PhoneNumber.cell_phone,
                                   'Сервісний центр':
                                       Faker::PhoneNumber.cell_phone
                                 })
    end

    before(:each) do
      sign_in admin
      patch :update_info, params: { static_info: attributes }
      info.reload
    end

    it 'redirects_to action: :home' do
      expect(response).to redirect_to(action: :home)
    end

    it 'changes attributes' do
      expect(info.email).to eql attributes[:email]
      expect(info.phones[:'Служба підтримки'])
        .to eql attributes[:phones][:'Служба підтримки']
      expect(info.phones[:'Відділ продажу'])
        .to eql attributes[:phones][:'Відділ продажу']
      expect(info.phones[:'Сервісний центр'])
        .to eql attributes[:phones][:'Сервісний центр']
    end
  end
end
