# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # before_action :set_account

  # def google_oauth2
  #   @user = User.create_from_provider_data(request.env['omniauth.auth'])
  #   if @user.persisted?
  #     sign_in_and_redirect @user
  #     set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
  #   else
  #     flash[:error]='There was a problem signing you in through Google. Please register or try signing in later.'
  #     redirect_to new_user_session_path
  #   end
  # end

  def google_oauth2
    user = User.from_omniauth(auth)
  
    if user.present?
      sign_out_all_scopes
      flash[:success] = I18n.t('devise.omniauth_callbacks.success', kind: 'Google', event: :authentication)
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] = I18n.t('devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized")
      redirect_to new_user_session_path
    end
  end

  # def google_oauth2
  #   user = User.from_omniauth(auth)

  #   if user.present?
  #     sign_out_all_scopes
  #     flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google', sign_in_and_redirect_user, event: :authentication
  #   else
  #     flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', 
  #     reason: "#{auth.info.email} is not authorized"
  #     redirect_to new_user_session_path
  #   end
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  private

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
