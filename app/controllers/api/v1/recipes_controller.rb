# app/controllers/api/v1/recipes_controller.rb
module Api
  module V1
    class RecipesController < ApplicationController
      before_action :set_recipe, only: [ :show, :update, :destroy ]
      before_action :require_creator!, only: [ :create, :update, :destroy ]

      def index
        render json: Recipe.all.order(created_at: :desc)
      end

      def show
        render json: @recipe.to_json(include: :ingredients)
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
          render json: @recipe
        else
          render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @recipe.destroy
        head :no_content
      end

      def search
        q = params[:q]
        recipes = Recipe.where("name LIKE ?", "%#{q}%")
        render json: recipes
      end

      private

      def set_recipe
        @recipe = Recipe.find(params[:id])
      end

      def recipe_params
        params.require(:recipe).permit(:name, :directions, :prep_time, :cook_time, :servings, :url)
      end
    end
  end
end
