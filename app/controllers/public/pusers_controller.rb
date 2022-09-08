class Public::UsersController < ApplicationController
  def show
    @user = User.find_by(params[:id])
    @catch = Catch.new
    @catches = @user.catches
  end
  def index
    @catch = Catch.new
    @user = current_user
    @users = User.all 
  end
  
end
