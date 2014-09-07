module HacklabDecorator

  class Decorator
    attr_accessor :object

    def initialize(object)
      @object = object
    end

    def h
      RequestStore.store[:current_controller].view_context
    end


    class << self
      def delegate_all
        define_method :method_missing do |m, *args, &block|
          if @object.respond_to?(m)
            @object.send(m, *args, &block)
          else
            super m, *args, &block
          end

        end
      end
    end

  end
end