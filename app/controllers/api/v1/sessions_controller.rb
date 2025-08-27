# app/controllers/api/v1/sessions_controller.rb
module Api
  module V1
    class SessionsController < ApplicationController
      # POST /api/v1/login
      def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
          session[:user_id] = user.id
          render json: { message: "Logged in", user: user.as_json(only: [ :id, :email, :role ]) }
        else
          render json: { error: "Invalid email or password" }, status: :unauthorized
        end
      end

      # DELETE /api/v1/logout
      def destroy
        session.delete(:user_id)
        render json: { message: "Logged out" }
      end
    end
  end
end
