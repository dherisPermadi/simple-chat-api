class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string  :email,              null: false, default: ""
      t.string  :encrypted_password, null: false, default: ""
      t.string  :name,               null: false, default: ""
      t.integer :status,             null: false, default: 0

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
