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