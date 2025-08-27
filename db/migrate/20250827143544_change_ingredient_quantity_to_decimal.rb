class ChangeIngredientQuantityToDecimal < ActiveRecord::Migration[8.0]
  def change
    change_column :ingredients, :quantity, :decimal, precision: 5, scale: 2
  end
end
