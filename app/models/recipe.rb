class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image
  has_rich_text :directions

  def as_json(options = {})
    super(only: [ :id, :name, :directions, :prep_time, :cook_time, :servings, :url ],
          include: {
            ingredients: { only: [ :id, :name, :quantity, :measurement ] },
            comments: {
              only: [ :id, :body ],
              include: { user: { only: [ :id, :email ] } }
            }
          })
  end
end
