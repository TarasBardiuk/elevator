# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StaticInfo, type: :model do
  subject { build(:static_info) }

  it_behaves_like 'valid model', 'StaticInfo'

  describe 'Email' do
    it_behaves_like 'valid email attribute'
  end

  describe 'In :phones hash' do
    it 'key should not be to short' do
      subject.phones[''] = subject.phones.delete(subject.phones.keys[0])
      expect(subject).to be_invalid
    end

    it 'key should not be to long' do
      subject.phones[('a' * 21)] = subject.phones
                                          .delete(subject.phones.keys[0])
      expect(subject).to be_invalid
    end

    it 'value do not need to be present' do
      subject.phones[subject.phones.keys[0]] = '     '
      expect(subject).to be_valid
    end
  end
end
