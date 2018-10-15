FactoryBot.define do
  factory :arboreta_tree, class: 'Arboreta::Tree' do
    tree_name { FFaker::Lorem.word }
  end
end
