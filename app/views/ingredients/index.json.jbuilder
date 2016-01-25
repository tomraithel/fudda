json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :quantity, :product_id, :receipe_id
  json.url ingredient_url(ingredient, format: :json)
end
