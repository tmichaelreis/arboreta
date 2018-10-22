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

FactoryBot.define do
  factory :arboreta_node, class: 'Arboreta::Node' do
    association :arboreta_tree, factory: :arboreta_tree

    trait :or do
      operator { "OR" }
    end

    trait :and do
      operator { "AND" }
    end

    trait :leaf do
      is_leaf { true }
      operator { "NOTHING" }
    end
  end
end
