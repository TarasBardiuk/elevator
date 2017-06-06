# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'GET #home' do
    let(:admin) { create(:admin) }
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
end
