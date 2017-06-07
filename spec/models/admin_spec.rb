# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin, type: :model do
  subject { build(:admin) }

  describe 'Admin' do
    it 'should be valid' do
      expect(subject).to be_valid
    end
  end

  describe 'First name' do
    it 'should be present' do
      subject.first_name = '     '
      expect(subject).to be_invalid
    end

    it 'should not be to short' do
      subject.first_name = 'a'
      expect(subject).to be_invalid
    end

    it 'should not be to long' do
      subject.first_name = 'a' * 30
      expect(subject).to be_invalid
    end
  end

  describe 'Last name' do
    it 'should be present' do
      subject.last_name = '     '
      expect(subject).to be_invalid
    end

    it 'should not be to short' do
      subject.last_name = 'a'
      expect(subject).to be_invalid
    end

    it 'should not be to long' do
      subject.last_name = 'a' * 30
      expect(subject).to be_invalid
    end
  end

  describe 'Password' do
    it 'should be present' do
      subject.password = '     '
      expect(subject).to be_invalid
    end

    it 'should not be to short' do
      subject.password = 'a' * 5
      expect(subject).to be_invalid
    end

    it 'should not be to long' do
      subject.password = 'a' * 15
      expect(subject).to be_invalid
    end

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
    it 'should be present' do
      subject.email = '     '
      expect(subject).to be_invalid
    end

    it 'should not be to long' do
      subject.email = 'a' * 244 + '@example.com'
      expect(subject).to be_invalid
    end

    it 'validation should accept valid addresses' do
      valid_addresses = []
      5.times { valid_addresses << Faker::Internet.email }
      valid_addresses.each do |valid_address|
        subject.email = valid_address
        expect(subject).to be_valid,
                           "#{valid_address.inspect} should be valid"
      end
    end

    it 'validation should reject invalid addresses' do
      invalid_addresses = %w[foo@bar..com user@example,com user_at_foo.org
                             user.name@example. foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        subject.email = invalid_address
        expect(subject).to be_invalid,
                           "#{invalid_address.inspect} should be invalid"
      end
    end
  end
end
