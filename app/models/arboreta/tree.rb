# == Schema Information
#
# Table name: arboreta_trees
#
#  id           :integer          not null, primary key
#  subject_id   :integer
#  subject_type :integer
#  tree_name    :string
#

module Arboreta
  class Tree < ApplicationRecord
    belongs_to :subject, polymorphic: true, optional: true, class_name: '::Arboreta::Tree'
  end
end
