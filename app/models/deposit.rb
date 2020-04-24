class Deposit < ApplicationRecord
  validates :id_number, presence: true
  validates :phone_number, presence: true 
  validates :new_deposit, presence: true
  validates :total_deposit, presence: true
  # @depoit = Deposit.create(deposited_at: Time.now, user_id: @user.id)
    # @deposit = Deposit.where(user_id: @user.id)
    # @deposit.each do |book|
    #   deposit.destroy
    # end
    # @user.destroy
end
