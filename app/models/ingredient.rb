class Ingredient < ApplicationRecord
  belongs_to :recipe

  # Validations
  validates :name,
            presence: true,
            length: { maximum: 100 },
            uniqueness: { scope: :recipe_id,
                          case_sensitive: false,
                          message: "must be unique per recipe" }

  # Quantity is optional but must be positive if present
  validates :quantity,
            numericality: { greater_than: 0 },
            allow_nil: true

  # Measurement required, supports free-form (e.g. "cups", "to taste", "as needed")
  validates :measurement, presence: true, length: { maximum: 50 }

  def as_json(options = {})
    super(only: [ :id, :name, :quantity, :measurement ])
  end
end
