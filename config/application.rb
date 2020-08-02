require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"

Bundler.require(*Rails.groups)

module QConcursos
  class Application < Rails::Application
    config.load_defaults 6.0
    config.api_only = true
    config.autoload_paths += ["#{Rails.root}/services"]
    config.autoload_paths += ["#{Rails.root}/repositories"]
    config.session_store = :cookie_store
  end
end
