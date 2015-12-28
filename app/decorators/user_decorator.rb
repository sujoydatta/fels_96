class UserDecorator < Draper::Decorator
  delegate_all
  decorates :user

  def show_unfollow_button
    h.link_to h.t(:unfollow), h.follow_path(model.id), remote: true,
      method: :delete, class: "btn unfollow btn-default"
  end

  def show_follow_button
    h.link_to h.t(:follow), h.follow_path(model.id), remote: true,
      method: :put, class: "btn follow btn-primary"
  end
end
