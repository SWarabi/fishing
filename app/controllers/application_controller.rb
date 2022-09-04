class ApplicationController < ActionController::Base
  
   def check_guest
     email = resource&.email || params[:uer][:email].downcase
     #emailをnillにしないために&を使用する
     #params[:uer][:email].downcaseを先に記載をするとアカウントが削除できる様になり問題が発生します
     if email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは編集・削除できません。'
     end
   end
end
