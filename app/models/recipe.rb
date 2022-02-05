# frozen_string_literal: true

class Recipe < ApplicationRecord
  # scope :search, ->(param) { where("'#{param}' = ANY(ingredients)") }
  scope :search, ->(params) { where("ingredients @> ?", "{#{params}}") }
end
