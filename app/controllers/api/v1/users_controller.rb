module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]

      def show
        return validate_response('User not found', :not_found) if @user.nil?

        json_response(UserSerializer.new(@user))
      end

      private

      def set_user
        @user = User.find(current_user.id)
      end
    end
  end
end
