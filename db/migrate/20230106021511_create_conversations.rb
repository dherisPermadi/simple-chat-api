class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.references :user
      t.references :contact
      t.timestamps
    end
  end
end
