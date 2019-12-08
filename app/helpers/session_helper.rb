module SessionHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if @current_user.nil?
      # 不要用find，因为这个在user_id为空时会抛出异常
      @current_user ||= User.find_by(id: session[:user_id])
    end
    @current_user
  end

  def log_in?
    !current_user.nil?
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end
end
