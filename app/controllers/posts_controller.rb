class PostsController < ApplicationController
  def index 
    @posts = current_user.posts.all + current_user.friends.map(&:posts)
    @posts = @posts.flatten
    @posts = @posts.sort_by { |post| post.created_at }
    @posts = @posts.reverse
  end

  def create 
    @post = Post.new(post_params)

    if @post.save 
      flash.notice = "Post created successfully"
      redirect_to posts_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private 

  def post_params 
    params.permit(:topic, :content, :author_id)
  end
end
