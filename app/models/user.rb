class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone_number, presence: true 
    validates :id_number, presence: true
    validates :password, presence: true
  end
end
