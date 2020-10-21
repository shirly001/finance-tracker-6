class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    #permits only the authentication keys on RegistrationController#create
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    #permits authentication keys plus password, password_confirmation and current_password
    #on RegistrationsController#update
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end  

end
