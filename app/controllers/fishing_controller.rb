class FishingController < ApplicationController
  # before_action :authenticate_user!
  
  def index
    @fishing = Fishing.new
    @fishings = Fishing.all
    @user = current_user
    @users = User.all 
  end
end
