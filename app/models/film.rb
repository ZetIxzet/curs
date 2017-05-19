class Film < ActiveRecord::Base
  has_many :parts
  has_many :addresses

  accepts_nested_attributes_for :parts, allow_destroy: true

  validates :name, presence: true
  validates :genre, presence: true
  validates :lasting, presence: true
  validates :country, presence: true
  validates :companies, presence: true
  validates :min_age, presence: true
end
