class CreateWithdrawals < ActiveRecord::Migration[6.0]
  def change
    create_table :withdrawals do |t|
      t.string :phone_number,null: false
      t.string :agent_number,null: false
      t.float :amount,null: false
      t.integer :pin,null: false

      t.timestamps
    end
  end
end
