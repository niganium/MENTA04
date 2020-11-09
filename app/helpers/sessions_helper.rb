module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def authenticate_user
    unless logged_in?
      flash[:error] = "ログインを行ってください"
      redirect_to new_session_path
    end
  end

  def no_authenticate
    if logged_in?
      redirect_to users_path
    end
  end
end