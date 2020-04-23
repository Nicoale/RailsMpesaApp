class CreateDeposits < ActiveRecord::Migration[6.0]
  def change
    create_table :deposits do |t|
      t.string :user_id
      t.string :phone_number
      t.string :new_deposit 
      t.string :total_deposit
      t.timestamps
    end
  end
end
