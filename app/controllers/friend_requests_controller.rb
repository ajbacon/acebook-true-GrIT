class FriendRequestsController < ApplicationController

  def create
    @friend_request = current_user.friend_requests.create(pending_friend_id: params[:pending_friend_id])
    redirect_to friendships_path
  end

  def index
    @user = User.find(session[:recipient_id])
    @requests = @user.friend_requests
  end

  def destroy
    @request = FriendRequest.find(params[:id])
    @request.destroy
    redirect_to request.referrer
  end

end
