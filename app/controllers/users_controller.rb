class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    find_user
    if @user
      session[:recipient_id] = @user.id
      @posts = Post.where(recipient_id: @user.id).order('created_at DESC')
      @comments = Comment.all.order('created_at DESC')
    else
      redirect_to error_path
    end
  end

  private

  def find_user
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @user = User.find_by(username: params[:id])
    end
  end
end
