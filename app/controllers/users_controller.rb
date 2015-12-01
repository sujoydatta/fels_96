class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]

  def index
    @users = User.paginate page: params[:page], per_page: 20
  end

  def show
  end

  private

  def load_user
    @user = User.find params[:id]
  end
end
