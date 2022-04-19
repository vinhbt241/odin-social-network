class PostsController < ApplicationController
  def index 
    @posts = current_user.post.all + current_user.friends.map(&:posts)
    @posts = @posts.flatten
    @posts = @posts.sort_by { |posts| post.created_at }
    @posts = @posts.reverse
  end
end
