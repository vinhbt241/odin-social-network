class FriendshipsController < ApplicationController
  def create 
    current_user.friend_rights << User.find(params[:requester_id])
    FriendRequest.where(requester_id: params[:requester_id]).where(addressee_id: current_user.id).delete_all

    flash.notice = "Friend Request Accepted!"
    redirect_to friend_requests_path, status: 303
  end
end
