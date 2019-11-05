
# overriding RegistrationsController
class RegistrationsController < Devise::RegistrationsController

  def create
    if sercret_code_matched?
      super
      @code.update(user: current_user) if current_user.present?
    else
      @user = User.new
      render 'new'
    end
  end

  private

  def sercret_code_matched?
    if params[:secret_code].present?
      @code = SecretCode.available.where('code = ?', params[:secret_code]).last
      return true if @code.present?
      flash[:error] = 'Secret code already used or not matched. Pleae try different code'
      return false
    else
      flash[:error] = 'Secret code is reuqired'
      return false
    end
  end

  def sign_up_params 
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end