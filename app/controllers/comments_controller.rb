class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @item = Item.find(params[:item_id])
    comment = @item.comments.build(comment_params)
    comment.user_id = current_user.id

    if comment.save
      UserMailer.notify_comment(comment).deliver
      redirect_to item_path(@item), notice: "コメントの作成に成功しました"
    else
      flash.now.alert = "コメントの作成に失敗しました"
      render "items/show"
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy
    redirect_to comment.item, notice: "コメントの削除に成功しました"
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
