class CreateIngredients < ActiveRecord::Migration[8.0]
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id
      t.string :name
      t.integer :quantity
      t.string :measurement

      t.timestamps
    end
  end
end
