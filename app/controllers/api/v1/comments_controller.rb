# app/controllers/api/v1/comments_controller.rb
module Api
  module V1
    class CommentsController < ApplicationController
      before_action :require_login
      before_action :set_recipe
      before_action :set_comment, only: [ :update, :destroy ]

      # GET /api/v1/recipes/:recipe_id/comments
      def index
        comments = @recipe.comments.includes(:user)
        render json: comments.as_json(
          only: [ :id, :body, :created_at, :updated_at ],
          include: { user: { only: [ :id, :email ] } }
        ), status: :ok
      end

      # POST /api/v1/recipes/:recipe_id/comments
      def create
        comment = @recipe.comments.build(comment_params.merge(user: current_user))
        if comment.save
          render json: comment.as_json(
            only: [ :id, :body, :created_at, :updated_at ],
            include: { user: { only: [ :id, :email ] } }
          ), status: :created
        else
          render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/recipes/:recipe_id/comments/:id
      def update
        if @comment.user == current_user || current_user.admin?
          if @comment.update(comment_params)
            render json: @comment.as_json(
              only: [ :id, :body, :created_at, :updated_at ],
              include: { user: { only: [ :id, :email ] } }
            ), status: :ok
          else
            render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { error: "Forbidden" }, status: :forbidden
        end
      end

      # DELETE /api/v1/recipes/:recipe_id/comments/:id
      def destroy
        if @comment.user == current_user || current_user.admin?
          @comment.destroy
          render json: { message: "Comment deleted" }, status: :ok
        else
          render json: { error: "Forbidden" }, status: :forbidden
        end
      end

      private

      def set_recipe
        @recipe = Recipe.find(params[:recipe_id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Recipe not found" }, status: :not_found
      end

      def set_comment
        @comment = @recipe.comments.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Comment not found" }, status: :not_found
      end

      def comment_params
        params.require(:comment).permit(:body)
      end
    end
  end
end
