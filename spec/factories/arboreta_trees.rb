# == Schema Information
#
# Table name: arboreta_trees
#
#  id           :integer          not null, primary key
#  subject_id   :integer
#  subject_type :integer
#  tree_name    :string
#

FactoryBot.define do
  factory :arboreta_tree, class: 'Arboreta::Tree' do
    tree_name { FFaker::Lorem.word }
  end
end
