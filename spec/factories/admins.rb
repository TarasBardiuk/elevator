# frozen_string_literal: true

FactoryGirl.define do
  factory :admin do
    email       { Faker::Internet.email }
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    password    { Faker::Internet.password(6, 12) }
  end
end
