# frozen_string_literal: true

Doorkeeper.configure do
  # scopes configurations
  default_scopes :user

  resource_owner_from_credentials do |_routes|
    result     = Doorkeepers::LoginService.new(params:).call
    valid_user = result[:user].present? ? result[:user] : nil

    if result[:err_type].present?
      valid_user = nil

      raise Doorkeeper::Errors::DoorkeeperError.new(result[:err_type])
    end

    valid_user
  end

  grant_flows %w[password]
  allow_blank_redirect_uri true
  skip_authorization do
    true
  end
  use_refresh_token
end
