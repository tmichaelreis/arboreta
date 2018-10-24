module Arboreta
  module ActiveRecord

    extend ActiveSupport::Concern

    included do

      def arboreta_send(method, *args)
        raise Arboreta::MethodNotPermittedError unless self.is_method_on_whitelist?(method)
        self.send(method, *args)
      end

      def is_method_on_whitelist?(method)
        self.class.arboreta_whitelist.include?(method.to_sym)
      end

    end

    class_methods do

      def arboreta_methods(*method_list)
        @_arboreta_methods = method_list.to_a
      end

      def arboreta_whitelist
        @_arboreta_methods || []
      end

    end

  end
end
