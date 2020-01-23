class FriendRequestsController < ApplicationController

  def create
    friend = User.find(params[:pending_friend_id])
    @friend_request = current_user.friend_request.create()
  end

end
