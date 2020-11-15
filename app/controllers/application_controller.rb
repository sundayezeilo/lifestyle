class ApplicationController < ActionController::Base
  include CategoriesHelper

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || categories_path
  end
  
  def redirect_back
    redirect_to(session[:forwarding_url])
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url
  end
end
