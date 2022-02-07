class AddStringFieldsForRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :ingredient_text, :string
  end
end
