class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
  validates :description, presence: true
  validates :description, presence: true
  validates_uniqueness_of :recipe, scope: :ingredient
end
