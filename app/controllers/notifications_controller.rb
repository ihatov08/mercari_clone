class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.all
  end

  def show

  end
end
