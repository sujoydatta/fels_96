class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def omniauth_request
    user = User.from_omniauth request.env["Omniauth.auth"]
    if user.persisted?
      flash[:notice] = t "welcome"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_path
    end
  end
  alias_method :google, :omniauth_request
end
