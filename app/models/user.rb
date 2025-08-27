class User < ApplicationRecord
  has_secure_password   # adds password= and authenticate
  enum role: { reader: 0, creator: 1, admin: 2 }
  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def as_json(options = {})
    super(only: [ :id, :email, :role ],
          include: {
            recipes: { only: [ :id, :name ] }
          })
  end
end
