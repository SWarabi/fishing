class Admins::UsersController < ApplicationController
  before_action :if_not_admin
  # before_action :set_restaurant, only: [:show, :edit, :destroy]
  def show
    @user = User.find(params[:id])
    @catches = @user.catches 
    # @catch = Catch.find(params[:id])
    @catch_comment = CatchComment.new
  end
  
  def index
    @users = User.all 
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    user = User.find(params[:id])  # データ（レコード）を1件取得
    user.destroy  # データ（レコード）を削除
    redirect_to admins_users_path  # 投稿一覧画面へリダイレクト  
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to admins_user_path(@user.id), notice: 'You have updated user successfully.'
    else
    render 'edit'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end
  
  
  # def if_not_admin
  #   redirect_to root_path unless current_user.admin?
  # Catch.where(admin: true,user_id: @user).page(params[:page]).order(created_at: :desc)
  # end

  # def set_restaurant
  #   @restaurant = Restaurant.find(params[:id])
  # end
end
