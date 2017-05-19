json.extract! film, :id, :name, :genre, :lasting, :country, :companies, :min_age, :created_at, :updated_at
json.url film_url(film, format: :json)
