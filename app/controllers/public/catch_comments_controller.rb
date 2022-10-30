class Public::CatchCommentsController < ApplicationController
  def create
    catch = Catch.find(params[:catch_id])
    comment = current_user.catch_comments.new(catch_comment_params)
    comment.catch_id = catch.id
    comment.save
    catch.create_notification_comment!(current_user, comment.id)
    redirect_to public_catch_path(catch)
  end
  
  def destroy
    user = User.find(params[:id])
    catch = Catch.find(params[:id])
    if catch.user_id == current_user.id
      @catch = Catch.find(params[:catch_id])
      comment = CatchComment.find_by(catch_id: params[:catch_id], id: params[:id])
      comment.catch_id = @catch.id
      comment.destroy
    end
  end

  private

  def catch_comment_params
    params.require(:catch_comment).permit(:comment)
  end
end
