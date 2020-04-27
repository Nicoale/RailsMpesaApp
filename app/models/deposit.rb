class Deposit < ApplicationRecord   
    validates :phone_number, presence: true, uniqueness: true, length: {in: 10..13}, numericality: {only_integer: true}
    validates :new_deposit, numericality: {only_integer: true}, presence: true, acceptance:{message: "deposit successful, your new balance is"}
    validates :balance, numericality: {only_integer: true}, presence: true
    validates :pin, numericality: {only_integer: true}, presence: true,length:{is: 4 }
end
