class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :login_required, only: [:index]

  protected
  def login_required #ログインしてなかったら新規投稿ページに遷移
    unless current_user.present?
      redirect_to signup_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:industry_id,:occupation_id,:iamge,:profile])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname,:iamge,:profile])
  end

end
