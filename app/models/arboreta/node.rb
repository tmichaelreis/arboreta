module Arboreta
  class Node < ApplicationRecord
    belongs_to :arboreta_tree, class_name: 'Arboreta::Tree'

    belongs_to :positive_child, class_name: 'Arboreta::Node', foreign_key: 'positive_child_id', optional: true
    belongs_to :negative_child, class_name: 'Arboreta::Node', foreign_key: 'negative_child_id', optional: true

    validates :positive_child, presence: true, unless: :is_leaf
    validates :negative_child, presence: true, unless: :is_leaf

    delegate :subject, to: :arboreta_tree

    def execute!
      if is_leaf?
        Arboreta.send(operator.downcase, input_data)
      else
        Arboreta.send(operator.downcase, left, right) ? execute_positive : execute_negative
      end
    end

    private

    def left
      subject.send(input_data['left']['method'], *input_data['left']['args'])
    end

    def right
      subject.send(input_data['right']['method'], *input_data['right']['args'])
    end

    def execute_positive
      positive_child.execute!
    end

    def execute_negative
      negative_child.execute!
    end

  end
end