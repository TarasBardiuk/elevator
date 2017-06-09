# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StaticInfo, type: :model do
  subject { build(:static_info) }

  describe 'StaticInfo' do
    it 'should be valid' do
      expect(subject).to be_valid
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

  describe 'In :phones hash' do
    it 'key should be present' do
      # subject.phones[subject.phones.keys[0]] = '     '
      subject.phones[''] = subject.phones.delete(subject.phones.keys[0])
      expect(subject).to be_invalid
    end

    it 'key should not be to short' do
      subject.phones['aaa'] = subject.phones.delete(subject.phones.keys[0])
      expect(subject).to be_invalid
    end

    it 'key should not be to long' do
      subject.phones[('a' * 21).to_s] = subject.phones
                                               .delete(subject.phones.keys[0])
      expect(subject).to be_invalid
    end

    it 'value do not need to be present' do
      subject.phones[subject.phones.keys[0]] = '     '
      expect(subject).to be_valid
    end
  end
end
