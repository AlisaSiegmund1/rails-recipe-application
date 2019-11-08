class Recipe < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, uniqueness: true, presence: true
  validates :image_url, presence: :true
  mount_uploader :photo, PhotoUploader
end
