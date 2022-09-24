class Public::FollowingsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = @user.followings
    
  end
end