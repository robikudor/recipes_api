# frozen_string_literal: true

class Recipe < ApplicationRecord
  def self.full_text_search(query)
    sql = %{
      SELECT #{Recipe.column_names.join(', ')},
             ts_rank(to_tsvector('english', ingredient_text), to_tsquery('english', '#{query}')) AS rank
      FROM recipes
      WHERE to_tsvector('english', ingredient_text) @@ to_tsquery('english', '#{query}')
      ORDER BY rank DESC
    }
    Recipe.find_by_sql(sql)
  end
end
