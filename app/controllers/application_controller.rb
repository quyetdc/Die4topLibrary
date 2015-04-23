class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    def authenticate_active_admin_user!
        authenticate_user!
        if current_user.role? :borrower
            flash[:alert] = "You are not authorized to access this resource!"
            redirect_to root_path
        end
    end
end
