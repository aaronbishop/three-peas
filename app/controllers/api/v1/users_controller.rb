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
          render json: {
            message: "Account created",
            token: nil, # placeholder for JWT
            user: user.as_json(only: [ :id, :email, :role ])
          }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # GET /api/v1/me
      def me
        if current_user
          render json: { user: current_user.as_json(only: [ :id, :email, :role ]) }, status: :ok
        else
          render json: { error: "Not logged in" }, status: :unauthorized
        end
      end

      # GET /api/v1/users (admin only)
      def index
        users = User.all
        render json: { users: users.as_json(only: [ :id, :email, :role ]) }, status: :ok
      end

      # PATCH/PUT /api/v1/users/:id
      def update
        user = User.find(params[:id])
        if current_user == user || current_user.admin?
          if user.update(user_params)
            render json: { user: user.as_json(only: [ :id, :email, :role ]) }, status: :ok
          else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { error: "Forbidden" }, status: :forbidden
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: "User not found" }, status: :not_found
      end

      # DELETE /api/v1/users/:id (admin only)
      def destroy
        user = User.find(params[:id])
        user.destroy
        render json: { message: "User deleted" }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: "User not found" }, status: :not_found
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :role)
      end
    end
  end
end
