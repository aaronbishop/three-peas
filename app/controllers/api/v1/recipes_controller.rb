# app/controllers/api/v1/recipes_controller.rb
module Api
  module V1
    class RecipesController < ApplicationController
      before_action :set_recipe, only: [ :show, :update, :destroy ]
      before_action :require_creator!, only: [ :create, :update, :destroy ]

      def index
        recipes = Recipe.includes(:ingredients).order(created_at: :desc)
        render json: recipes.to_json(include: :ingredients), status: :ok
      end

      def show
        render json: @recipe.to_json(include: :ingredients), status: :ok
      end

      def create
        recipe = Recipe.new(recipe_params)
        if recipe.save
          render json: recipe, status: :created
        else
          render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @recipe.update(recipe_params)
          render json: @recipe, status: :ok
        else
          render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @recipe.destroy
        head :no_content
      end

      def search
        recipes = Recipe.where("name LIKE ?", "%#{params[:q]}%")
        render json: recipes, status: :ok
      end

      private

      def set_recipe
        @recipe = Recipe.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Recipe not found" }, status: :not_found
      end

      def recipe_params
        params.require(:recipe).permit(:name, :directions, :prep_time, :cook_time, :servings, :url)
      end

      # Stub for now — enforce role/ownership later
      def require_creator!
        unless current_user&.role == "creator"
          render json: { error: "Forbidden" }, status: :forbidden
        end
      end
    end
  end
end
