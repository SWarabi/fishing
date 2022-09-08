class Admins::CatchesController < ApplicationController
  
  def destroy
    catch = Catch.find(params[:id])  # データ（レコード）を1件取得
    user = catch.user
    catch.destroy  # データ（レコード）を削除
    redirect_to admins_user_path(user.id) # 投稿一覧画面へリダイレクト  
  end
  
  private
  def catch_params
    params.require(:catch).permit(:image, :fish, :point, :gear, :day, :time, :comment, :user_id)  
  end
end
