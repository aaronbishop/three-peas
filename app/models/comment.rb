class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  def as_json(options = {})
    super(only: [ :id, :body, :created_at ],
          include: { user: { only: [ :id, :email ] } })
  end
end
