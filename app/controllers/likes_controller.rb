class LikesController < ApplicationController
  def create
    if current_user.likes.create!(post_id: params[:post_id])
      flash[:success] = 'Post liked'
      redirect_to posts_path
    end
  end

  def destroy
    like = Like.find(params[:id])
    if like.destroy
      flash[:success] = 'You no longer like this post'
      redirect_to posts_path
    end
  end
end
