class Pokemon < ActiveRecord::Base
  has_many :poke_desks, dependent: :destroy
  has_many :users, through: :poke_desks
end
