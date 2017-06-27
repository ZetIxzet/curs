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
  def destroy_addresses_parts
    self.addresses.each{|x| x.destroy}
    self.parts.each{|x| x.destroy}
  end

  def self.search(params)
    result = Film.eager_load(:parts, parts: :actor)

    if params['min_age'].present?
      result = result.where(min_age: params['min_age'])
    end
    if params['companies'].present?
      result = result.where(companies: params['companies'])
    end
    if params['country'].present?
      result = result.where(country: params['country'])
    end
    if params['lasting'].present?
      result = result.where(lasting: params['lasting'])
    end
    if params['genre'].present?
      result = result.where(genre: params['genre'])
    end
    if params['name'].present?
      result = result.where(name: params['name'])
    end

    if params['role'].present?
      result = result.where("parts.role": params['role'])
    end

    if params['fn'].present?
      result = result.where("actors.fn": params['fn'])
    end
    if params['ln'].present?
      result = result.where("actors.ln": params['ln'])
    end
    if params['sn'].present?
      result = result.where("actors.sn": params['sn'])
    end
    if params['birthday'].present?
      result = result.where("actors.birthday": params['birthday'])
    end
    result.all
  end
end


