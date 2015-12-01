class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options options = {}
    {locale: I18n.locale}.merge options
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = t "auth_error"
    redirect_to root_path
  end
end
