class AddUniqueIndexToIngredients < ActiveRecord::Migration[8.0]
  def change
    add_index :ingredients, [ :recipe_id, :name ], unique: true, name: "index_ingredients_on_recipe_id_and_name"
  end
end
