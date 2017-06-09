# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)
# Admin.create!({email: "gu2y@gmail.com", password: "111111", password_confirmation: "111111" })

Admin.where(email: 'taras.bardyuk@gmail.com')
     .first_or_create(first_name: 'Taras',
                      last_name: 'Bardiuk',
                      password: '666666')

StaticInfo.where(email: 'example@example.com')
          .first_or_create(phones: {'Служба підтримки': '+380984552576', 
                                    'Відділ продажів': '+380505089224',
                                    'Сервісний центр': '+380322450352'})