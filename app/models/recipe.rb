# frozen_string_literal: true

class Recipe < ApplicationRecord
  def self.full_text_search(query_params = [])
    search_params = query_params&.join(' & ') || ''
    sql = %{
      SELECT id, ingredients,
             ts_rank(to_tsvector('english', ingredient_text), to_tsquery('english', '#{search_params}')) AS rank
      FROM recipes
      WHERE to_tsvector('english', ingredient_text) @@ to_tsquery('english', '#{search_params}')
      ORDER BY rank
    }
    Recipe.find_by_sql(sql)
  end
end
