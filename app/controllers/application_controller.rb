class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    response_403
  end

  private

  def response_403
    respond_to do |format|
      format.json { render :json => { success: false, message: "You can't perform the action." } }
      format.html { redirect_to user_session_path, flash: { :error => "You can't access the page." } }
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :password, :remember_me)
    end
  end
end
