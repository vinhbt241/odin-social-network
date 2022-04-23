class FriendRequestsController < ApplicationController
  def index
    @requesters = current_user.requesters 
    @potential_friends = User.where.not(id: current_user.id).where.not(id: current_user.friends.map(&:id)).where.not(id: current_user.addressees.map(&:id))
  end
end
