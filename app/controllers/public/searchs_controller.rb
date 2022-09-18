class Public::SearchsController < ApplicationController
  def search
    # viewのform_tagにて
    # 選択したmodelの値を@modelに代入。
    @model = params["model"]
    # 選択した検索方法の値を@methodに代入。
    @content = params["content"]
     # 検索ワードを@contentに代入。
    @method = params["method"]
    # @model, @content, @methodを代入した、
    # search_forを@recordsに代入。
    @records = search_for(@model, @content, @method)
  end
  
  private
  def search_for(model, content, method)
    # 選択したモデルがuserだったら
    if model == 'user'
      # 選択した検索方法がが完全一致だったら
      if method == 'perfect'
        User.where(name: content)
      # 選択した検索方法がが部分一致だったら
      else
        User.where('name LIKE ?', '%'+content+'%')
      end
    # 選択したモデルがcatchだったら
    elsif model == 'fish'
      if method == 'perfect'
        Catch.where(fish: content)
      else
        Catch.where('fish LIKE ?', '%'+content+'%')
      end
    
    elsif model == 'address'
      if method == 'perfect'
        Catch.where(address: content)
      else
        Catch.where('address LIKE ?', '%'+content+'%')
      end
    end
  end
  
end
