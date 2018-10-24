module Arboreta
  module ActiveRecord

    extend ActiveSupport::Concern

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
