class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: current_user.allowed_feeds).new_first
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    post = Post.new(post_params)
    if post.save
      flash[:notice] = 'Post created!'
      redirect_to '/posts'
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

private

  def post_params
    params.require(:post).permit(:author_id, :title, :content)
  end
end
