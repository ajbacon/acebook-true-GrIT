class FriendRequestsController < ApplicationController

  def create
    @friend_request = current_user.friend_requests.create(pending_friend_id: params[:pending_friend_id])
    redirect_to friendships_path
  end

  def update

    @request = FriendRequest.find(params[:id])
    # there is potentially a neater way to do this through
    # the has_many / belongs_ to relationship
    current_user.friendships.create(friend_id: @request.user_id)
    @request.destroy
    redirect_to request.referrer

  end

  def index
    @user = User.find(session[:recipient_id])
    @requests = FriendRequest.where(pending_friend_id: @user.id)
  end

  def destroy
    @request = FriendRequest.find(params[:id])
    @request.destroy
    redirect_to request.referrer
  end

  def accept
    user.pending_friend << friends
    destroy
  end

end
