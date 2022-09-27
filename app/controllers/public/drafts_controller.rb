class Public::DraftsController < ApplicationController
  def index
    @user = current_user
    @catches = Catch.where(is_draft: true,user_id: @user).page(params[:page]).order(created_at: :desc)
  end
  
  def edit
    @catch = Catch.find(params[:id])
    if @catch.user_id == current_user.id
      render :edit
    else
      redirect_to public_catch_path
    end
  end
  
  
  
  
  private
  def catch_params
    params.require(:catch).permit(:image, :fish, :point, :gear, :day, :time, :address, :comment, :user_id)  
  end
 

end