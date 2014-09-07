module HacklabDecorator

  class Decorator
    attr_accessor :object

    def self.object_class=(val)
      @object_class = val
    end

    def self.object_class
      @object_class
    end

    def initialize(object)
      @object = object
      self.class.object_class = object.class
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
      def method_missing(method, *args, &block)
        return super unless @object.respond_to?(method)
        object_class.send(method, *args, &block)
      end
    end

  end
end