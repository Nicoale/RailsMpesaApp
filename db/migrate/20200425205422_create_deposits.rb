# frozen_string_literal: true

class CreateDeposits < ActiveRecord::Migration[6.0]
  def change
    create_table :deposits do |t|
      t.string :phone_number, null: false
      t.float :new_deposit, null: false, default: 0.0
      t.float :balance, null: false, default: 0.0
      t.integer :pin, null: false, default: 1234

      t.timestamps
    end
  end
end
