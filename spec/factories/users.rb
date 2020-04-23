FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    id_number { "12345678" }
    phone_number { "0700000000000" }
    password { "VerStrong.123" }
    password_confirmation { "VerStrong.123" }
    balance { 1.5 }
    pin{1452}
  end
end
