class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Disable CSRF for API-only usage (safe if you’re just doing JSON API)
  protect_from_forgery with: :null_session

  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    unless logged_in?
      render json: { error: "Must be logged in" }, status: :unauthorized
    end
  end

  def require_creator!
    unless current_user&.creator? || current_user&.admin?
      render json: { error: "Not authorized" }, status: :forbidden
    end
  end

  def require_admin!
    unless current_user&.admin?
      render json: { error: "Admin only" }, status: :forbidden
    end
  end
end
