class Cinema < ActiveRecord::Base
  has_many :addresses

  accepts_nested_attributes_for :addresses, allow_destroy: true

  validates :name, presence: true
  validates :address, presence: true
end
