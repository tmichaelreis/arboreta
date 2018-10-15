module Arboreta
  class Node < ApplicationRecord
    belongs_to :arboreta_tree, class_name: 'Arboreta::Tree'

    belongs_to :positive_child, class_name: 'Arboreta::Node', foreign_key: 'positive_child_id', optional: true
    belongs_to :negative_child, class_name: 'Arboreta::Node', foreign_key: 'negative_child_id', optional: true

    validates :positive_child, presence: true, unless: :is_leaf
    validates :negative_child, presence: true, unless: :is_leaf
  end
end