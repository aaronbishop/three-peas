class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  def as_json(options = {})
    super(only: [ :id ],
          include: { recipe: { only: [ :id, :name ] } })
  end
end
