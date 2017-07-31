FactoryGirl.define do
  factory :page do
    name {Faker::Name.name}
    url {Faker::Internet.url}
    visited_at {Faker::Time.between(2.days.ago, Date.today, :all)}
    association :user, factory: :user
  end
end
