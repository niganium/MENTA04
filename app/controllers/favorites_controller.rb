class FavoritesController < ApplicationController
  before_action :authenticate_user

  def create
    @post = Post.find(params[:post_id])
    favorite = @post.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to request.referer
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
    redirect_to request.referer
  end
end
