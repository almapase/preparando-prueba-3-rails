class Sighting < ActiveRecord::Base
  belongs_to :pokemon

  validates :pokemon_id, :information, :picture, presence: true

  mount_uploader :picture, PictureSightingUploader
end
