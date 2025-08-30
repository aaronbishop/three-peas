class User < ApplicationRecord
  has_secure_password

  enum :user_role, { admin: 0, creator: 1, reader: 2 }

  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 20 }, allow_nil: true

  def as_json(_opts = {})
    {
      "id"        => id,
      "email"     => email,
      "user_role" => user_role,
      "recipes"   => recipes.map { |r|
        {
          "id"         => r.id,
          "name"       => r.name,
          "directions" => r.directions.to_s, # ActionText safe
          "prep_time"  => r.prep_time,
          "cook_time"  => r.cook_time,
          "servings"   => r.servings,
          "url"        => r.url
        }
      },
      "comments"  => comments.map { |c|
        {
          "id"        => c.id,
          "body"      => c.body,
          "recipe_id" => c.recipe_id
        }
      },
      "favorites" => favorites.map { |f|
        {
          "id"        => f.id,
          "recipe_id" => f.recipe_id
        }
      }
    }
  end
end
