module Api
  module V1
    class MessagesController < ApplicationController
      before_action :doorkeeper_authorize!
      before_action :set_message, only: %i[destroy read_text]
      def index
        messages   = Message.where(conversation_id: params[:conversation_id])
                            .order(created_at: :desc)
                            .page(params[:page] || 1)
                            .per(params[:per_page] || 10)
        serializer = generate_collection_serializer(messages, MessageSerializer)
        json_response_page(serializer, messages)
      end

      def create
        message = Message.new(message_params)

        if message.save
          json_response(MessageSerializer.new(message))
        else
          validate_response(message.errors.full_messages.to_sentence)
        end
      end

      def destroy
        @message.destroy

        message_response('Delete Message success!')
      end

      def read_all_text
        if Message.where(receiver_id: current_user.id).unread.update(is_read: true)
          message_response('Set all Message as read success!')
        else
          message_response('Set all Message as read failed!')
        end
      end

      def read_text
        if @message.update(is_read: true)
          message_response('Set Message as read success!')
        else
          message_response('Set Message as read failed!')
        end
      end

      private

      def set_message
        @message = Message.find(params[:id])
      end

      def message_params
        params.require(:message)
              .permit(:conversation_id, :contact_id, :text_message, :is_read, :sender_id, :receiver_id)
      end
    end
  end
end