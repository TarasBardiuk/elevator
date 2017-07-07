# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin, type: :model do
  subject { build(:admin) }

  it_behaves_like 'valid model', 'Admin'

  describe 'First name' do
    it_behaves_like 'correct account attribute', :first_name
  end

  describe 'Last name' do
    it_behaves_like 'correct account attribute', :last_name
  end

  describe 'Password' do
    it_behaves_like 'correct account attribute', :password

    it 'validation should accept valid passwords' do
      valid_passwords = []
      5.times { valid_passwords << Faker::Internet.password(6, 12) }
      valid_passwords.each do |valid_password|
        subject.password = valid_password
        expect(subject).to be_valid,
                           "#{valid_password.inspect} should be valid"
      end
    end
  end

  describe 'Email' do
    it_behaves_like 'valid email attribute'
  end
end
