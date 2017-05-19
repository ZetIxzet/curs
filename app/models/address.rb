class Address < ActiveRecord::Base
  belongs_to :film
  belongs_to :cinema
validates :film_id, :cinema_id, presence: true
end
