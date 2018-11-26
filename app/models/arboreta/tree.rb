# == Schema Information
#
# Table name: arboreta_trees
#
#  id           :integer          not null, primary key
#  subject_id   :integer
#  subject_type :integer
#  tree_name    :string
#  template     :boolean          default(FALSE)
#

module Arboreta
  class Tree < ApplicationRecord
    belongs_to :subject, polymorphic: true, optional: true, class_name: '::Arboreta::Tree'

    has_many :arboreta_nodes, foreign_key: 'arboreta_tree_id', class_name: 'Arboreta::Node'

    amoeba do
      enable
      clone :arboreta_nodes
      set :template => false
    end
  end
end
