class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Found the following code at these two sites:
  # http://stackoverflow.com/questions/27698983/saving-other-attributes-to-user-model-with-devise-gem
  # http://www.peoplecancode.com/tutorials/adding-custom-fields-to-devise
  # https://github.com/kradul/bewd_sf_12/blob/master/13_Authentication/notes.md

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :phone, :email, :password) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :phone, :email, :password, :current_password) }
    end
end