FactoryBot.define do
  factory :buddy_user do
    association :user
    association :buddy
  end
end
