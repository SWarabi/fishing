class Public::CatchCommentsController < ApplicationController
  def create
    catch = Catch.find(params[:catch_id])
    comment = current_user.catch_comments.new(catch_comment_params)
    comment.catch_id = catch.id
    comment.save
    redirect_to public_catch_path(catch)
  end
  
  def destroy
    @catch = Catch.find(params[:book_id])
    comment = CatchComment.find_by(catch_id: params[:catch_id], id: params[:id])
    comment.catch_id = @catch.id
    comment.destroy
  end

  private

  def catch_comment_params
    params.require(:catch_comment).permit(:comment)
  end
end
