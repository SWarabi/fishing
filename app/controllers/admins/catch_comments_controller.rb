class Admins::CatchCommentsController < ApplicationController
  
  def destroy
    @catch = Catch.find(params[:catch_id])
    comment = CatchComment.find_by(catch_id: params[:catch_id], id: params[:id])
    comment.catch_id = @catch.id
    comment.destroy
    if request.referer&.include?("/admins/users/")
      redirect_to admins_user_path(@catch.user.id)
    else
      redirect_to admins_catch_path(@catch.id)
    end
  end
end
