class ApplicationController < ActionController::Base
    before_action :authenticate_user! # Devise authentication
    before_action :set_ability

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_url, alert: exception.message
    end
      

  private

  def set_ability
    @current_ability ||= Ability.new(current_user)
  end

end
