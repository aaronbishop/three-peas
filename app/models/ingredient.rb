class Ingredient < ApplicationRecord
  validates :name, presence: true
  belongs_to :recipe

  def as_json(options = {})
    super(only: [ :id, :name, :quantity, :measurement ])
  end
end
