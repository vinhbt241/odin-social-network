class LikesController < ApplicationController
  def create 
    @like = Like.new(like_params)

    unless Like.where(user_id: @like.user.id).where(post_id: @like.post.id).first.nil?
      redirect_to posts_path, status: :unprocessable_entity
      return 
    else
      @like.save 
      redirect_to posts_path
    end
  end

  def destroy
    user_like = Like.where(user_id: current_user.id).where(post_id: params[:post_id]).first

    unless user_like.nil?
      user_like.delete
      redirect_to posts_path, status: 303
    else
      flash.notice = "This post don't contain your vote"
      redirect_to posts_path
    end
  end

  private 

  def like_params 
    params.permit(:user_id, :post_id)
  end
end
