class Conversation < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  has_many :messages, dependent: :destroy

  def unread_messages
    messages.where(receiver_id: Current.user.id).unread.count
  end
end
