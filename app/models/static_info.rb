# frozen_string_literal: true

class StaticInfo < ApplicationRecord
  serialize :phones

  REGEXP_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true,
                    length: { maximum: 255 }, format: { with: REGEXP_EMAIL }
  validates :phones, presence: true, hash: true
end
