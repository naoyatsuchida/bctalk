class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:industry_id,:occupation_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname,:iamge,:profile,:industry_id,:occupation_id])

  end
end
