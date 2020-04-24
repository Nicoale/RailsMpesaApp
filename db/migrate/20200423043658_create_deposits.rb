class CreateDeposits < ActiveRecord::Migration[6.0]
  def change
    create_table :deposits do |t|
      t.string :user_id, null: false
      t.string :phone_number, null: false
      t.string :new_deposit ,default: 0.0
      t.string :total_deposit, default: 0.0
      t.timestamps
    end
  end
end
