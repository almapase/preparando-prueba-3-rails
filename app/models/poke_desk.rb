class PokeDesk < ActiveRecord::Base
  belongs_to :user
  belongs_to :pokemon

  before_save :set_default_level

  def set_default_level
    self.level = level || 5
  end
end
