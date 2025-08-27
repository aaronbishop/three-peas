# app/controllers/api/v1/favorites_controller.rb
module Api
  module V1
    class FavoritesController < ApplicationController
      before_action :require_login
      before_action :set_recipe, only: [ :create, :destroy ]

      # GET /api/v1/favorites
      def index
        favorites = current_user.favorite_recipes
        render json: favorites
      end

      # POST /api/v1/recipes/:recipe_id/favorite
      def create
        favorite = current_user.favorites.build(recipe: @recipe)
        if favorite.save
          render json: { message: "Recipe added to favorites" }, status: :created
        else
          render json: { errors: favorite.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/recipes/:recipe_id/favorite
      def destroy
        favorite = current_user.favorites.find_by(recipe: @recipe)
        if favorite
          favorite.destroy
          render json: { message: "Recipe removed from favorites" }
        else
          render json: { error: "Not in favorites" }, status: :not_found
        end
      end

      private

      def set_recipe
        @recipe = Recipe.find(params[:recipe_id])
      end
    end
  end
end
