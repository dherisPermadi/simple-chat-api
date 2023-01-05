module Doorkeepers
  # service class for doorkeeper login service
  class LoginService
    def initialize(params:)
      @params    = params
      @user_type = @params['scope']
      @result    = { user: nil, err_type: nil }
    end

    def call
      user = find_by_scope
      if user.present?
        password_validation(user)
      else
        user_not_found
      end

      @result[:user] = user if user.present?

      @result
    end

    private

    def find_by_scope
      user = User.find_for_database_authentication(email: @params[:email])
    end

    def password_validation(user)
      if user.try(:valid_password?, @params[:password])
        user.valid_for_authentication? { true }
      else
        user.valid_for_authentication? { false }
        password_not_valid
      end
    end

    def user_not_found
      @result[:err_type] = 'user_not_found'
    end

    def password_not_valid
      @result[:err_type] = 'password_not_valid'
    end
  end
end
