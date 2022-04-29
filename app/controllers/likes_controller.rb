class LikesController < ApplicationController
  def update_like 
    user_like = Like.where(user_id: current_user.id).where(post_id: params[:post_id]).first

    if user_like.nil?
      like = Like.new(user_id: current_user.id, post_id: params[:post_id])
      like.save
      redirect_to posts_path
    else
      user_like.delete
      redirect_to posts_path, status: 303
    end
  end
end
