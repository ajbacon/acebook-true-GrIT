class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.create(:friend_id => params[:friend_id])
    if @friendship
      flash[:notice] = "Added friend."
    else
      flash[:notice] = "Unable to add friend."
    end
    redirect_to request.referrer
  end

  def index
    @user = User.find(session[:recipient_id])
    @friendships = @user.friendships
    @inverse_friendships = @user.inverse_friendships
    @pending_requests = @user.friend_requests
    @non_friends = non_friends(@user)
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to friendships_path
  end

  private

  def post_params
    params.require(:friendship).permit(:friend_id)
  end

  def non_friends(user)
    friends = user.friends + user.inverse_friends
    User.all - friends - [user] - user.pending_friends
  end
end
