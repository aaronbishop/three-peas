class Recipe < ApplicationRecord
  has_many :ingredients
  has_one_attached :image
  has_rich_text :directions
  validates :name, presence: true
  validates :directions, presece: true
end
