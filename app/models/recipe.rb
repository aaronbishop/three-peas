class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image
  has_rich_text :directions

  # Validations
  validates :name, presence: true,
                   length: { maximum: 100 },
                   uniqueness: { scope: :user_id,
                                 case_sensitive: false,
                                 message: "must be unique per user" }

  validates :directions, presence: true

  validates :prep_time, numericality: { only_integer: true,
                                        greater_than_or_equal_to: 0 },
                        allow_nil: true

  validates :cook_time, presence: true,
                        numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :servings, presence: true,
                       numericality: { only_integer: true, greater_than: 0 }

  validates :url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
                            message: "must be a valid URL" },
                  length: { maximum: 255 },
                  uniqueness: { case_sensitive: false,
                          message: "must be unique across all recipes" },
                  allow_blank: true

  def as_json(options = {})
    super(
      only: %i[id name directions prep_time cook_time servings url],
      include: {
        ingredients: { only: %i[id name quantity measurement] },
        comments: {
          only: %i[id body],
          include: { user: { only: %i[id email] } }
        },
        favorites: { only: %i[id user_id] }
      }
    )
  end
end
