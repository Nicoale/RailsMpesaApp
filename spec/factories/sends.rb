FactoryBot.define do
  factory :send do
    senders_phone_no { "MyString" }
    receivers_phone_no { "MyString" }
    balance { 1.5 }
    amount { 1.5 }
    pin { 1 }
  end
end
