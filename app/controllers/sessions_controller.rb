class SessionsController < ApplicationController
  def new
  end

  def create
    redirect_to new_user_path
  end
end
