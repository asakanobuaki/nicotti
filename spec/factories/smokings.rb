FactoryBot.define do
  factory :smoking do
    association :user

    trait :invalid do
      user { nil }
    end
  end
end
