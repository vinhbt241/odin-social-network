class CommentsController < ApplicationController
  def create 
    @comment = Comment.new(comment_params)

    if @comment.save 
      redirect_to posts_path
    else
      render 'posts/index', status: :unprocessable_entity
    end
  end

  private 
  
  def comment_params 
    params.permit(:user_id, :post_id, :content)
  end
end
