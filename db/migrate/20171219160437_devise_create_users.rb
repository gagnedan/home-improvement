class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## omniauthable
      t.string :facebook_id

      ## role
      t.string :role

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true

  end
end
