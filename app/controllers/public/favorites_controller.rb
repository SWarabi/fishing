class Public::FavoritesController < ApplicationController
  def create
    @catch = Catch.find(params[:catch_id])
    # catch = current_user.favorites.new(catch_id: @catch.id)
    current_user.favorites.find_or_create_by(catch_id: @catch.id)
    # catch.save
  end

  def destroy
    @catch = Catch.find(params[:catch_id])
    favorite = current_user.favorites.find_by(catch_id: @catch.id)
    favorite.destroy if favorite
  end
end
