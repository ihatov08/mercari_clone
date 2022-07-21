class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment

  def new
    @report = @comment.reports.build
    @report.user_id = current_user.id
  end

  def create
  end

  private

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end
