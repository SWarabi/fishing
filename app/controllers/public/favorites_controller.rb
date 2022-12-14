class Public::FavoritesController < ApplicationController
  def create
    @catch = Catch.find(params[:catch_id])
    # catch = current_user.favorites.new(catch_id: @catch.id)
    current_user.favorites.find_or_create_by(catch_id: @catch.id)
    @catch.create_notification_like!(current_user)
    
    # catch.save
  end

  def destroy
    @catch = Catch.find(params[:catch_id])
    favorite = current_user.favorites.find_by(catch_id: @catch.id)
    favorite.destroy if favorite
  end
  
  def index
    # @catches = Catch.all
     @catches = Catch.where(is_draft: false).page(params[:page])
     @catches = Kaminari.paginate_array(Catch.where(is_draft: false).sort{|a,b| b.favorites.size <=> a.favorites.size}).page(params[:page])
    # left_outer_joins(:favorites).group('catch.id').select('catches.*, COUNT(favorites.*) AS favorites_count').distinct.reorder(catches_count: :desc).limit(100)
  end
  
  
end
