class AddUniqueIndexToComments < ActiveRecord::Migration[8.0]
  def change
    add_index :comments, [ :user_id, :recipe_id, :body ], unique: true, name: "index_comments_on_user_recipe_body"
  end
end
