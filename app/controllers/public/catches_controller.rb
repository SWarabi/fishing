class Public::CatchesController < ApplicationController
  def new
    @catch = Catch.new  
    @catches = Catch.all
  end
  
  def create
    @catch = Catch.new(catch_params)
    #データをデータベースに保存するためのsaveメソッド実行
    if @catch.save
      redirect_to '/public/catches'
    else
      render :new
    end  
    
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
    if @catch.user_id == current_user.id
      render :edit
    else
      redirect_to public_catch_path
    end
  end
  
  def update
    catch = Catch.find(params[:id])
    catch.update(catch_params)
    redirect_to public_catch_path(catch.id)  
  end
  
  def map
  # respond_to以下の記述によって、
  # remote: trueのアクセスに対して、
  # map.js.erbが変えるようになります。
  respond_to do |format|
    format.js
      end
  end
  
  def destroy
    catch = Catch.find(params[:id])
    catch.destroy
    redirect_to public_user_path(current_user.id)
  end
  
  private
  def catch_params
    params.require(:catch).permit(:image, :fish, :point, :gear, :day, :time, :address, :comment, :user_id)  
  end
end

# map = Map.new(map_params)
#     if map.save
      
#       redirect_to :action => "/public/catches"
#     else
#       redirect_to :action => "/public/catches"
#     end
#     def map_params
#     params.require(:map).permit(:address, :latitude, :longitude)
#   end