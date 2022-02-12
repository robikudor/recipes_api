# frozen_string_literal: true

class AddGinIndexForRecipe < ActiveRecord::Migration[6.0]
  def up
    execute "CREATE INDEX recipes_gin_ingredient_text ON recipes USING GIN(to_tsvector('english', ingredient_text))"
  end

  def down
    execute 'DROP INDEX recipes_gin_ingredient_text'
  end
end
