class User < ApplicationRecord
    validates :first_name, presence: true, length:{maximum: 30},format: { with: /\A[a-zA-Z]+\z/}
    validates :last_name, presence: true, length:{maximum: 30}, format: { with: /\A[a-zA-Z]+\z/}
    validates :phone_number, presence: true, uniqueness: true, length: {in: 10..13},format: { with: /\A[a-zA-Z]+\z/}
    validates :id_number, presence: true, uniqueness: true, length: {in: 7..9}
    validates :password, presence: true,  length:{minimum: 8}
    validates :pin, presence: true,length:{is: 4 }
end
