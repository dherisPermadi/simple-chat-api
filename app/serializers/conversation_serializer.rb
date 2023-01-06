class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :contact, :unread_messages, :last_message

  def last_message
    object.messages&.last&.text_message
  end
end
