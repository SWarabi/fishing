class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @catches = @user.catches.where(is_draft: false)
  end
  
  def edit
    @user = User.find(params[:id])
    if @user.email == 'guest@example.com'
      redirect_to public_user_path(current_user)
      return
    end
    if @user == current_user
      render :edit
    else
        redirect_to public_user_path(current_user)
    end
  end
  
  def index
    @users = User.all
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to public_user_path(@user.id), notice: 'You have updated user successfully.'
    else
    render 'edit'
    end
  end
  
  def followers
    @user = User.find(params[:id])
    @users = User.all
  end
  
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:catch_id)
    @favorite_catches = Catch.find(favorites)
  end
  
  def withdrawal
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
  
end
