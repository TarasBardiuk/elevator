# frozen_string_literal: true

class Admin < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true,
                                     length: { minimum: 2, maximum: 25 }
  validates :email, presence: true, length: { maximum: 255 }
end
