FactoryBot.define do
  factory :buddy do
    sequence(:line_id) { |n| "U0e1827745#{n}"}
    sequence(:name) { |n| "バディ#{n}" }
    buddy_image { 'default.image' }
  end
end
