require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Batmanic
  class Application < Rails::Application
    config.before_initialize do |app|
      require 'sprockets'
      require 'slim'

      Sprockets::Engines
      Sprockets.register_engine '.slim', Slim::Template
    end
  end
end
