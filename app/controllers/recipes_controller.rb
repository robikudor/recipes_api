# frozen_string_literal: true

class RecipesController < ApplicationController
  include PaginationHelper

  def index
    recipes = Recipe.all
    render json: {
      recipes: paginate(recipes),
      page: page,
      per_page: per_page,
      total_count: recipes.count
    }
  end

  def show
    render json: Recipe.find(params[:id])
  end
end
