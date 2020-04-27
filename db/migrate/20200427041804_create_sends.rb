class CreateSends < ActiveRecord::Migration[6.0]
  def change
    create_table :sends do |t|
      t.string :senders_phone_number,null: false
      t.string :receivers_phone_number,null: false
      t.float :amount,null: false
      t.float :balance,null: false
      t.integer :pin,null: false

      t.timestamps
    end
  end
end
