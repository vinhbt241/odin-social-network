class FriendRequestsController < ApplicationController
  def index
    @requesters = current_user.requesters 
    @potential_friends = User.where.not(id: current_user.id).where.not(id: current_user.friends.map(&:id)).where.not(id: current_user.addressees.map(&:id)).where.not(id: current_user.requesters.map(&:id))
  end

  def create 
    current_user.addressees << User.find(params[:potential_friend_id])
    flash.notice = "Friend request sent!"
    redirect_to friend_requests_path, status: 303
  end
end
