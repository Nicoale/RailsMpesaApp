# frozen_string_literal: true

FactoryBot.define do
  factory :withdrawal do
    phone_number { 'MyString' }
    agent_number { 'MyString' }
    amount { 1.5 }
    pin { 1 }
  end
end
