json.array!(@receipes) do |receipe|
  json.extract! receipe, :id, :title, :description, :link, :persons
  json.url receipe_url(receipe, format: :json)
end
