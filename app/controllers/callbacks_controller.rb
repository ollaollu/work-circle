class CallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    flash[:success] = "You have logged in successfully with Facebook"
    sign_in_and_redirect @user
  end
end
