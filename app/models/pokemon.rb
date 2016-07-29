class Pokemon < ActiveRecord::Base
  has_many :poke_desks
  has_many :users, through: :poke_desks
end
