class SessionController < ApplicationController
  def new
    if current_user
      redirect_to admin_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if !user
      flash[:danger] = "该邮箱不存在"
      render 'new'
    elsif user.authenticate(params[:session][:password])
      log_in user
      # session[:user_id] = user.id
      redirect_to admin_path
    else
      flash[:danger] = "密码错误"
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to admin_path
  end

  private

  def user_params
    params.require(:user).permit(
        :email,
        :password
    )
  end
end
