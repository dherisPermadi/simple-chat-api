module Api
  module V1
    class ConversationsController < ApplicationController
      before_action :doorkeeper_authorize!
      before_action :set_conversation, only: :destroy

      def index
        conversations = Conversation.joins(:contact)
                                    .where('conversations.user_id = :user_id OR contacts.phone_number = :phone_number', { user_id: current_user.id, phone_number: current_user.phone_number })
                                    .ransack(params[:q])
                                    .result
                                    .order(created_at: :desc)
                                    .page(params[:page] || 1)
                                    .per(params[:per_page] || 10)
        serializer = generate_collection_serializer(conversations, ConversationSerializer)
        json_response_page(serializer, conversations)
      end

      def destroy
        @conversation.destroy

        message_response('Delete Conversation success!')
      end

      private

      def set_conversation
        @conversation = Conversation.find(params[:id])
      end
    end
  end
end
