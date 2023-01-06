class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text_message, :is_read, :sender_id, :receiver_id, :conversation_id, :created_at
end
