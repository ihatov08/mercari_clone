class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.all
  end

  def show
    @notification = Notification.find(params[:id])
  end
end
