require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Tokyo"
    # config.eager_load_paths << Rails.root.join("extras")
    config.generators do |g|
        g.assets false
        g.skip_routes true
        g.helper false
        g.test_framework  :test_unit, fixture: false
    end

    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
  end
end
