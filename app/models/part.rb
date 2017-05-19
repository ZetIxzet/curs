class Part < ActiveRecord::Base
  belongs_to :film
  belongs_to :actor

  validates :role, :film_id, :actor_id, presence: true

  accepts_nested_attributes_for :actor, allow_destroy: true
end
