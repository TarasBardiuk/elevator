# frozen_string_literal: true

FactoryGirl.define do
  factory :static_info do
    email { Faker::Internet.email }
    phones do
      { 'Служба підтримки': Faker::PhoneNumber.cell_phone,
        'Відділ продажу':  Faker::PhoneNumber.cell_phone,
        'Сервісний центр':  Faker::PhoneNumber.cell_phone }
    end
  end
end
