json.extract! sighting, :id, :information, :picture, :pokemon_id, :created_at, :updated_at
json.url sighting_url(sighting, format: :json)