class Actor < ActiveRecord::Base
  has_many :parts

  validates :ln, presence: true
  validates :fn, presence: true
  validates :sn, presence: true
  validates :birthday, presence: true
end
