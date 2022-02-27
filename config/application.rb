require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Nicotti
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Tokyo"
    config.active_record.default_timezone :local
    # config.eager_load_paths << Rails.root.join("extras")
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      if instance.kind_of?(ActionView::Helpers::Tags::Label)
        html_tag.html_safe
      else
        class_name = instance.instance_variable_get(:@object_name)
        method_name = instance.instance_variable_get(:@method_name)
        input_error_icon = html_tag.gsub("class=\"", "class=\"is-invalid ").html_safe
        below_error_message = "<div class=\"invalid-feedback\">#{I18n.t("activerecord.attributes.#{class_name}.#{method_name}")}#{instance.error_message.first}</div>".html_safe
        input_error_icon.concat(below_error_message)
      end
    end

  end
end
