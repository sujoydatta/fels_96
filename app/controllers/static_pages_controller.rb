class StaticPagesController < ApplicationController
  def home
    @notifications = Notification.all.paginate page: params[:page], per_page: 10
  end

  def about
  end

  def contact
  end
end
