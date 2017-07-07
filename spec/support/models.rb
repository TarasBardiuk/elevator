# frozen_string_literal: true

RSpec.shared_examples 'valid model' do |model|
  describe model do
    it 'should be valid' do
      expect(subject).to be_valid
    end
  end
end

RSpec.shared_examples 'correct account attribute' do |part|
  it 'should be present' do
    subject.send("#{part}=", '     ')
    expect(subject).to be_invalid
  end

  it 'should not be to short' do
    subject.send("#{part}=", 'a')
    expect(subject).to be_invalid
  end

  it 'should not be to long' do
    subject.send("#{part}=", 'a' * 30)
    expect(subject).to be_invalid
  end
end

RSpec.shared_examples 'valid email attribute' do
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
