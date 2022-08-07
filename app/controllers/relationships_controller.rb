class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])
    current_user.follow(user)

    redirect_to user_path(user), notice: "フォローに成功しました"
  end

  def destroy
  end
end
