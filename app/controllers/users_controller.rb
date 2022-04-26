class UsersController < ApplicationController
  def show
    @profile = current_user.profile
    @posts = current_user.posts
  end
end
