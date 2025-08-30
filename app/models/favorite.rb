class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  # Prevent a user from favoriting the same recipe more than once
  validates :user_id, uniqueness: { scope: :recipe_id, message: "has already favorited this recipe" }

  # Make sure both associations are always present
  validates :user, presence: true
  validates :recipe, presence: true

  def as_json(_options = {})
    super(
      only: [ :id, :user_id, :recipe_id ],
      include: {
        recipe: { only: [ :id, :name ] }
      }
    )
  end
end
