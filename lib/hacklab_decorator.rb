require 'request_store'
require 'hacklab_decorator/version'
require 'hacklab_decorator/decoratable'
require 'hacklab_decorator/decorator'
require 'hacklab_decorator/helpers_support'
require 'hacklab_decorator/railtie' if defined?(Rails)


module HacklabDecorator

  def self.setup_orm(base)
    base.class_eval do
      include HacklabDecorator::Decoratable
    end
  end

  def self.setup_action_controller(base)
    base.class_eval do
      include HacklabDecorator::HelpersSupport
      before_action :setup_current_controller
    end

  end

end