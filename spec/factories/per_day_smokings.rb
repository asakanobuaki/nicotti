FactoryBot.define do
  factory :per_day_smoking do
    number_of_smoking { 1 }
    smoked_on { "2022-01-27" }
    user { nil }
  end
end
