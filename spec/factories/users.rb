FactoryBot.define do
  factory :user, class: 'User' do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    age { rand(1..100) }
  end
end
