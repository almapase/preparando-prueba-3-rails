class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [ :admin, :user]
  has_many :poke_desks, dependent: :destroy
  has_many :pokemons, through: :poke_desks
end
