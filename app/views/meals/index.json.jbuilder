json.array!(@meals) do |meal|
  json.extract! meal, :id, :day, :receipe_id
  json.url meal_url(meal, format: :json)
end
