class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.references :user
      t.string   :name, null: false
      t.string   :phone_number, null: false
      t.timestamps
    end
  end
end
