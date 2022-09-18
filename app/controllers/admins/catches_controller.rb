class Admins::CatchesController < ApplicationController
  def index
     @catches = Catch.all
  end
  def show
    @catch = Catch.find(params[:id])
    @catch_comment = CatchComment.new
  end
  
  def destroy
    catch = Catch.find(params[:id])  # データ（レコード）を1件取得
    user = catch.user
    catch.destroy  # データ（レコード）を削除
    if request.referer&.include?("/admins/users/")
      redirect_to admins_user_path(user.id)
    else
      redirect_to admins_catches_path
    end
  end
  
  private
  def catch_params
    params.require(:catch).permit(:image, :fish, :point, :gear, :day, :time, :comment, :user_id)  
  end
end
