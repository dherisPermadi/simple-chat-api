require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SimpleChatApi
  class Application < Rails::Application
    config.load_defaults 7.0
    config.time_zone = "Asia/Jakarta"
    config.autoload_once_paths << "#{Rails.root}/lib"
    config.api_only = true
  end
end
