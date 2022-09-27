class Admins::UsersController < ApplicationController
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
  
end
