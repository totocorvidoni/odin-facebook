class CommentsController < ApplicationController
  def new
    
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:success] = 'Comment Created!'
      redirect_back(fallback_location: posts_path) 
    end
  end

private
    
  def comment_params
    params.require(:comment).permit(:author_id, :post_id, :content)
  end
end
