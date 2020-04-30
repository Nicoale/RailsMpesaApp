# frozen_string_literal: true

FactoryBot.define do
  factory :deposit do
    phone_number { '021345678' }
    new_deposit { 1.5 }
    balance { 1.5 }
    pin { 1234 }
  end
end
