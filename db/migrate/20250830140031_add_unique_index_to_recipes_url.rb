class AddUniqueIndexToRecipesUrl < ActiveRecord::Migration[8.0]
  def change
    add_index :recipes, :url, unique: true
  end
end
