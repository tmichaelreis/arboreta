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

FactoryBot.define do
  factory :arboreta_tree, class: 'Arboreta::Tree' do
    tree_name { FFaker::Lorem.word }
  end

  factory :arboreta_tree_template, class: 'Arboreta::Tree' do
    tree_name { FFaker::Lorem.word }
    template { true }

    trait :with_nodes do
      after(:create) do |tree|
        4.times do
          FactoryBot.create(:arboreta_node, is_leaf: true, arboreta_tree: tree)
        end
      end
    end
  end
end
