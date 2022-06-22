json.array!(@smokings) do |smoking|
  json.id smoking.id
  json.start smoking.created_at
  json.end smoking.created_at
end

json.array!(@per_day_smokings) do |day_smoking|
  json.id day_smoking.id
  json.title day_smoking.number_of_smoking
  json.start day_smoking.smoked_on
end
