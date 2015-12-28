class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]

  def index
    @users = User.paginate page: params[:page], per_page: 20
  end

  def show
    @activities = PublicActivity::Activity.where(owner_id: @user.id)
      .order "created_at DESC"
  end

  private
  def load_user
    @user = User.find(params[:id]).decorate
  end
end
