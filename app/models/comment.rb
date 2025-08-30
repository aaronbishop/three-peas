class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  # Must always have text
  validates :body, presence: true, length: { minimum: 2, maximum: 1000 }

  # Associations must exist
  validates :user, presence: true
  validates :recipe, presence: true

  # Prevent duplicate comments by the same user on the same recipe
  validates :body, uniqueness: { scope: [ :user_id, :recipe_id ],
                                 message: "has already been posted for this recipe" }

  def as_json(_options = {})
    super(
      only: [ :id, :body, :created_at ],
      include: {
        user: { only: [ :id, :email ] }
      }
    )
  end
end
