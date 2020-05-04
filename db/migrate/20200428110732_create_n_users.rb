class CreateNUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :n_users do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
