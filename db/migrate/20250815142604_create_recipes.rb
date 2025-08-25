class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.text :directions
      t.string :prep_time
      t.string :cook_time
      t.integer :servings
      t.string :url

      t.timestamps
    end
    add_index :recipes, :name
  end
end
