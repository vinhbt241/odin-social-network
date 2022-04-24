class LikesController < ApplicationController
  def create 
    @like = Like.new(like_params)

    unless Like.where(user_id: @like.user.id).where(post_id: @like.post.id).empty?
      redirect_to posts_path, status: :unprocessable_entity
      return 
    end

    if @like.save 
      redirect_to posts_path
    end
  end

  def destroy
    Like.where(user_id: current_user.id).where(post_id: params[:post_id]).delete_all
    redirect_to posts_path, status: 303
  end

  private 

  def like_params 
    params.permit(:user_id, :post_id)
  end
end
