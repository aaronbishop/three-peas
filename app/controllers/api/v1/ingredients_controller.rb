# app/controllers/api/v1/ingredients_controller.rb
module Api
  module V1
    class IngredientsController < ApplicationController
      before_action :set_recipe
      before_action :set_ingredient, only: [ :show, :update, :destroy ]
      before_action :require_creator!, only: [ :create, :update, :destroy ]

      # GET /api/v1/recipes/:recipe_id/ingredients
      def index
        render json: @recipe.ingredients, status: :ok
      end

      # GET /api/v1/recipes/:recipe_id/ingredients/:id
      def show
        render json: @ingredient, status: :ok
      end

      # POST /api/v1/recipes/:recipe_id/ingredients
      def create
        ingredient = @recipe.ingredients.build(ingredient_params)
        if ingredient.save
          render json: ingredient, status: :created
        else
          render json: { errors: ingredient.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/recipes/:recipe_id/ingredients/:id
      def update
        if @ingredient.update(ingredient_params)
          render json: @ingredient, status: :ok
        else
          render json: { errors: @ingredient.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/recipes/:recipe_id/ingredients/:id
      def destroy
        @ingredient.destroy
        head :no_content
      end

      # GET /api/v1/ingredients/search?q=...
      def search
        results = Ingredient.where("name LIKE ?", "%#{params[:q]}%")
        render json: results, status: :ok
      end

      private

      def set_recipe
        @recipe = Recipe.find(params[:recipe_id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Recipe not found" }, status: :not_found
      end

      def set_ingredient
        @ingredient = @recipe.ingredients.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Ingredient not found" }, status: :not_found
      end

      def ingredient_params
        params.require(:ingredient).permit(:name, :quantity, :measurement)
      end

      # Stub until we wire role enforcement
      def require_creator!
        unless current_user&.role == "creator"
          render json: { error: "Forbidden" }, status: :forbidden
        end
      end
    end
  end
end
