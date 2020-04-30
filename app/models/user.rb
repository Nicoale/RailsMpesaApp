# frozen_string_literal: true

class User < ApplicationRecord
  PASSWORD_REGEX = /\A (?=.{8,}) (?=.*\d) (?=.*[a-z]) (?=.*[A-Z])(?=.*[[:^alnum:]])/x.freeze
  validates :first_name, presence: true, length: { maximum: 30 }, format: { with: /\A[a-zA-Z]+\z/ }
  validates :last_name, presence: true, length: { maximum: 30 }, format: { with: /\A[a-zA-Z]+\z/ }
  validates :phone_number, presence: true, uniqueness: true, length: { in: 10..13 }, numericality: { only_integer: true }
  validates :id_number, presence: true, uniqueness: true, length: { in: 7..9 }, numericality: { only_integer: true }
  validates :password, presence: true, format: { with: PASSWORD_REGEX, message: 'too weak' }, confirmation: true
  validates :pin, numericality: { only_integer: true }, presence: true, length: { is: 4 }
  validates :password_confirmation, presence: true
  has_secure_password
end
