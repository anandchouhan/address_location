class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

   protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:shop_name, :shop_add, :shop_detail, :password, :password_confirmation, :email, :latitude, :longitude) }
  end

  def after_sign_in_path_for(resource)
   	users_path
  end

  def after_sign_up_path_for(resource)
    users_path
  end

  def after_sign_out_path_for(resource)
    '/users/sign_in'
  end

end