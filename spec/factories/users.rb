# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    id_number { '12345678' }
    phone_number { '0123456789' }
    password { 'VerStrong.123' }
    password_confirmation { 'VerStrong.123' }
    # balance { 0.0}
    # pin{1452}
  end
end
