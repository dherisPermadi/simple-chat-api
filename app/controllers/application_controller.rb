class ApplicationController < ActionController::API
  include Response
  include SerializerGenerator

  def current_user
    return if doorkeeper_token.nil?

    user = User.find_by(id: doorkeeper_token.resource_owner_id)
    Current.user = user

    user
  end
end
