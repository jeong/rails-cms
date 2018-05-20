require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module RailsCms
  class Application < Rails::Application
    config.load_defaults 5.2

    config.generators do |g|
      g.javascript_engine :js
    end
  end
end
