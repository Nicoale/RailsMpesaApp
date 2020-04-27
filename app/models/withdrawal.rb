class Withdrawal < ApplicationRecord   
    validates :phone_number, presence: true, uniqueness: true, length: {in: 10..13}, numericality: {only_integer: true}
    validates :amount, numericality: {only_integer: true}, presence: true
    validates :agent_number, numericality: {only_integer: true}, presence: true,length:{is: 7 }
    validates :pin, numericality: {only_integer: true}, presence: true,length:{is: 4 }, acceptance:{message: "withdrawal successful, your new balance is"}
end
