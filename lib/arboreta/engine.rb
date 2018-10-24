module Arboreta
  class Engine < ::Rails::Engine
    isolate_namespace Arboreta

    initializer 'arboreta.initialize' do
      ::ActiveRecord::Base.send :include, ::Arboreta::ActiveRecord
    end
  end
end
