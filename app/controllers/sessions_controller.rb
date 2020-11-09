class SessionsController < ApplicationController
  before_action :no_authenticate, only: [:new, :create]
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
      if user && user.authenticate(session_params[:password])
        session[:user_id] = user.id
        redirect_to users_path, notice: 'ログインに成功しました'
      else
        flash.now[:danger] = 'ログインに失敗しました'
        render :new
      end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end

  private
  def session_params
    params.require(:session).permit(:email, :password, :remember_me)
  end
end
