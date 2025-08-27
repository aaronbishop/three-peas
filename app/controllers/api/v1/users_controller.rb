# app/controllers/api/v1/users_controller.rb
module Api
  module V1
    class UsersController < ApplicationController
      before_action :require_admin!, only: [ :index, :destroy ]
      before_action :require_login, only: [ :me, :update ]

      # POST /api/v1/signup
      def create
        user = User.new(user_params)
        if user.save
          session[:user_id] = user.id
          render json: user.as_json(only: [ :id, :email, :role ]), status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # GET /api/v1/me
      def me
        if current_user
          render json: current_user.as_json(only: [ :id, :email, :role ])
        else
          render json: { error: "Not logged in" }, status: :unauthorized
        end
      end

      # GET /api/v1/users (admin only)
      def index
        render json: User.all.as_json(only: [ :id, :email, :role ])
      end

      # PATCH/PUT /api/v1/users/:id
      def update
        user = User.find(params[:id])
        if current_user == user || current_user.admin?
          if user.update(user_params)
            render json: user.as_json(only: [ :id, :email, :role ])
          else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { error: "Forbidden" }, status: :forbidden
        end
      end

      # DELETE /api/v1/users/:id (admin only)
      def destroy
        user = User.find(params[:id])
        user.destroy
        head :no_content
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :role)
      end
    end
  end
end
