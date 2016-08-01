class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :poke_desks, dependent: :destroy
  has_many :pokemons, through: :poke_desks

  enum role: [:player, :admin]

  before_save :default_role

  def default_role
   self.role ||= 0
  end
end
