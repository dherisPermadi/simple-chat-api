module Api
  module V1
    class ContactsController < ApplicationController
      before_action :doorkeeper_authorize!
      before_action :set_contact, only: %i[show update destroy]

      def index
        contacts   = Contact.where(user_id: current_user.id)
                            .ransack(params[:q])
                            .result
                            .order(name: :asc)
                            .page(params[:page] || 1)
                            .per(params[:per_page] || 10)
        serializer = generate_collection_serializer(contacts, ContactSerializer)
        json_response_page(serializer, contacts)
      end

      def show
        @contact ? json_response(ContactSerializer.new(@contact)) : validate_response('Data not found!')
      end

      def create
        contact = Contact.new(contact_params)
        contact.user_id = current_user.id

        if contact.save
          json_response(ContactSerializer.new(contact))
        else
          validate_response(contact.errors.full_messages.to_sentence)
        end
      end

      def update
        if @contact.update(contact_params)
          json_response(ContactSerializer.new(@contact))
        else
          validate_response(@contact.errors.full_messages.to_sentence)
        end
      end

      def destroy
        @contact.destroy

        message_response('Delete Contact success!')
      end

      private

      def set_contact
        @contact = Contact.find(params[:id])
      end

      def contact_params
        params.require(:contact)
              .permit(:name, :phone_number)
      end
    end
  end
end