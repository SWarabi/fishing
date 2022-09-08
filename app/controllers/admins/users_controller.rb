class Admins::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @catches = @user.catches 
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
    redirect_to '/admins_user'  # 投稿一覧画面へリダイレクト  
  end
  
end
