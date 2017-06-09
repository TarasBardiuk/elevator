# frozen_string_literal: true

FactoryGirl.define do
  factory :static_info do
    email 'example@example.org'
    phones do
      { 'Служба підтримки': '+380984552576',
        'Відділ продажів': '+380505089224',
        'Сервісний центр': '+380322450352' }
    end
  end
end
