class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment

  def new
    @report = @comment.reports.build
    @report.user_id = current_user.id
  end

  def create
    @report = @comment.reports.build(report_params)
    @report.user_id = current_user.id

    if @report.save
      redirect_to item_path(@report.comment.item), notice: "通報の作成に成功しました"
    else
      flash.now.alert = "通報の作成に失敗しました"
      render :new
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

  def report_params
    params.require(:report).permit(:report_reason_id, :body)
  end
end
