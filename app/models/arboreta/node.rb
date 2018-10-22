# == Schema Information
#
# Table name: arboreta_nodes
#
#  id                :integer          not null, primary key
#  input_data        :jsonb
#  operator          :string           not null
#  is_root           :boolean          default(FALSE)
#  is_leaf           :boolean
#  positive_child_id :integer
#  negative_child_id :integer
#  arboreta_tree_id  :integer
#

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
        # TODO: Execute terminal actions
        Arboreta.nothing
      else
        Arboreta.send(operator.downcase, *statements) ? execute_positive : execute_negative
      end
    end

    private

    def statements
      input_data.map do |data|
        Arboreta::Statement.new(data.merge({'subject' => self.subject}))
      end
    end

    def execute_positive
      positive_child.execute!
    end

    def execute_negative
      negative_child.execute!
    end

  end
end
