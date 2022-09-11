class Admins::CatchCommentsController < ApplicationController
  
  def destroy
    @catch = Catch.find(params[:catch_id])
    comment = CatchComment.find_by(catch_id: params[:catch_id], id: params[:id])
    comment.catch_id = @catch.id
    comment.destroy
    redirect_to admins_user_path(@catch.user.id)
  end
end
