json.array!(@smokings) do |smoking|
  json.id smoking.id
  json.title smoking.number_of_smoking
  json.start smoking.smoked_on
end