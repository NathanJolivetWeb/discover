class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :modal_import
  protect_from_forgery with: :exception
  
  private 

  def modal_import
    if params[:room].present?
      @roadtrip = Roadtrip.find(params[:room])
    else
      @roadtrip = Roadtrip.last
    end

    @message = Message.new
  end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :username, :photo, :email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :username, :photo, :email, :password, :current_password)}
  end

end
