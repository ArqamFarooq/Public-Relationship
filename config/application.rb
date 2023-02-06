require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PRAdvisor
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.autoload_paths << "#{Rails.root}/app/uploaders"

    config.assets.enabled = true
    config.assets.paths << Rails.root.join("app", "assets", "videos")
    config.active_storage.service = :local
    config.active_storage.service = :local
    config.active_storage.service_configurations = {
      local: {
        root: Rails.root.join("storage"),
        server: Rails.application.secrets.active_storage_server,
        public: true
      }
    }
    config.autoload_paths += %W(#{config.root}/app/uploaders)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
