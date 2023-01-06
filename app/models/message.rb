class Message < ApplicationRecord
  belongs_to :conversation

  attr_accessor :contact_id
  
  scope :unread, -> { where(is_read: false) }

  validates :text_message, presence: true

  before_validation :generate_conversation, on: :create, if: -> { conversation_id.blank? }

  private

  def generate_conversation
    new_conversation = Conversation.create(user_id: sender_id, contact_id: contact_id)

    self.conversation_id = new_conversation.id
  end
end
