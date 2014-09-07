module HacklabDecorator

  module Decoratable

    def decorate(options = {})
      klass = options[:with] || "#{self.class.to_s}Decorator".constantize
        klass.new(self)
    end

  end

end