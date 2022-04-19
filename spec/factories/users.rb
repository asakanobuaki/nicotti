FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "ユーザー#{n}" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    excess_cigarette { 0 }
    target_number { 2 }
    state { :healthy }
    life { 1 }
    role { :general }
    invite_code { "bID#{SecureRandom.hex(4)}"}

    trait :baldness do
      excess_cigarette { 5 }
      target_number { 0 }
      state { :healthy }
    end

    trait :cancer do
      excess_cigarette { 7 }
      target_number { 0 }
      state { :baldness }
    end

    trait :reborn do
      excess_cigarette { 9 }
      target_number { 0 }
      state { :cancer }
    end
  end
end


