class Public::CatchesController < ApplicationController

  def new
    @catch = Catch.new
  end
  
  def create
    @catch = Catch.new(catch_params)
    if params[:commit]
      @catch.is_draft = false
    end
    #データをデータベースに保存するためのsaveメソッド実行
    if @catch.save(context: :publicize)
      redirect_to '/public/catches'
       # 下書きボタンを押下した場合
    else
      if @catch.update(is_draft: true)
        redirect_to public_user_path(current_user), notice: "下書き保存しました！"
      else
        render :new
      end  
    end
  end
  
  def index
    @catches = Catch.where(is_draft: false).page(params[:page]).order(created_at: :desc)
  end
  
  
  def show
    @catch = Catch.find(params[:id])
    if @catch.is_draft == true
      redirect_to public_catches_path
    end
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
    @catch = Catch.find(params[:id])
    # ①下書き更新（公開）の場合
    if params[:publicize_draft]
      # 公開時にバリデーションを実施
      # updateメソッドにはcontextが使用できないため、公開処理にはattributesとsaveメソッドを使用する
      @catch.attributes = catch_params.merge(is_draft: false)
      if @catch.save(context: :publicize)
        redirect_to public_catch_path(@catch.id)
      else
        @catch.is_draft = true
        render template: 'public/drafts/edit'
      end
    # ②更新の場合
    elsif params[:update_catch]
      @catch.attributes = catch_params
      if @catch.save(context: :publicize)
        redirect_to public_catch_path(@catch.id)
      else
        render :edit
      end
    # ③下書きの更新（非公開）の場合
    else
      #byebug
      if @catch.update(catch_params.merge(is_draft: true))
        redirect_to public_catch_path(@catch.id), notice: "下書きを更新しました！"
      else
        render :edit, alert: "更新できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    end
  end
  
  def map
    respond_to do |format|
      format.js
    end
  end
  
  def destroy
    user = User.find(params[:id])
    catch = Catch.find(params[:id])
    if catch.user_id == current_user.id
    catch.destroy
    redirect_to public_user_path(current_user.id)
    else
      redirect_to public_user_path(current_user.id)
    end
  end
  
  private
  def catch_params
    params.require(:catch).permit(:image, :fish, :point, :gear, :day, :time, :address, :comment, :user_id)  
  end
end
