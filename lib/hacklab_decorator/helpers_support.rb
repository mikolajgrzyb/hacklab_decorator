module HacklabDecorator

  module HelpersSupport

    extend ActiveSupport::Concern

    def setup_current_controller
      RequestStore.store[:current_controller] = self
    end

  end


end