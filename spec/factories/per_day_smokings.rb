FactoryBot.define do
  factory :per_day_smoking do
    number_of_smoking { 1 }
    smoked_on { Date.today }
    association :user

    trait :no_user_id do
      user { nil }
    end
  end
end
