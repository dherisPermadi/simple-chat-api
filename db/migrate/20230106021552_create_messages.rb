class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :conversation
      t.text       :text_message
      t.boolean    :is_read, default: false
      t.integer    :sender_id
      t.integer    :receiver_id
      t.timestamps
    end
  end
end
