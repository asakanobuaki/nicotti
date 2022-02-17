json.array!(@user) do |user|
  json.id user.id
  json.remaining user.remaining_number
end