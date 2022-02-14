# frozen_string_literal: true

class RecipesController < ApplicationController
  include PaginationHelper

  def index
    recipes = Recipe.full_text_search(processed_query)
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

  private

  def search_params
    params.permit(:search)
  end

  def processed_query
    return '' unless search_params[:search]

    search_params[:search].split(' ').join(' | ')
  end
end
