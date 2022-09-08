class Public::CatchesController < ApplicationController
  def new
    @catch = Catch.new  
  end
  
  def create
    catch = Catch.new(catch_params)
    #データをデータベースに保存するためのsaveメソッド実行
    catch.save
    #index画面へリダイレクト
    redirect_to '/public/catches'
  end
  
  def index
     @catches = Catch.all
  end
  
  def show
    @catch = Catch.find(params[:id])
    @catch_comment = CatchComment.new
  end
  
  def edit
    @catch = Catch.find(params[:id])  
  end
  
  def update
    catch = Catch.find(params[:id])
    catch.update(catch_params)
    redirect_to public_catch_path(catch.id)  
  end
  
  private
  def catch_params
    params.require(:catch).permit(:image, :fish, :point, :gear, :day, :time, :comment, :user_id)  
  end
end
