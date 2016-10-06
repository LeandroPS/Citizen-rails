class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	
	protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :cidade
    
  end
end
