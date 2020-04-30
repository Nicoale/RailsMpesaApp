# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :id_number, null: false
      t.string :phone_number, null: false
      t.integer :pin, default: 1234
      t.float :balance, null: false, default: 0.0
      t.string :password
      t.string :password_confirmation

      t.timestamps
    end
  end
end
