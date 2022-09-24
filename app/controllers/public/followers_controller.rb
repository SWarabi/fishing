class Public::FollowersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = @user.followers
    
  end
end
