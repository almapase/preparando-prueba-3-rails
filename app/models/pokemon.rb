class Pokemon < ActiveRecord::Base
  has_many :poke_desks, dependent: :destroy
  has_many :users, through: :poke_desks
  has_many :sightings, dependent: :destroy

  scope :filter_by_name, ->(query) { where("name like ?", "%#{query}%")  }
end
