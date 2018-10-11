module Arboreta
  class Tree < ApplicationRecord
    belongs_to :subject, polymorphic: true, optional: true, class_name: '::Arboreta::Tree'
  end
end
