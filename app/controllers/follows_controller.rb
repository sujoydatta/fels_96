class FollowsController < ApplicationController
  before_action :authenticate_user!

  def update
    follower = current_user
    followee = User.find params[:id]
    if follower.follow followee
      render json: {data: t(:followed)}
    else
      render json: {data: t(:followed_fail)}, status: 403
    end
  end

  def destroy
    follower = current_user
    followee = User.find params[:id]
    if follower.unfollow followee
      render json: {data: t(:unfollowed)}
    else
      render json: {data: t(:unfollowed_fail)}, status: 403
    end
  end
end
