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
  end
  
  private
  def catch_params
    params.require(:catch).permit(:image, :fish, :point, :gear, :day, :time, :comment, :user_id)  
  end
end
