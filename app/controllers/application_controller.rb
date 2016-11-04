class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  prepend_before_filter :require_no_authentication, only: [:cancel ]
    before_filter :configure_permitted_parameters, if: :devise_controller?

def after_sign_in_path_for(admin)
  contacts_admin_this_month_path
end

def after_sign_in_path_for(user)
  new_contact_path
end
    protected

    def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :admin_id, :admin])
	    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :admin_id, :admin])
    end
end
