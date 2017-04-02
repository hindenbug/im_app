class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  protected

  def current_user
    if cookies.signed[:user_id]
      @current_user ||= User.new(id: cookies.signed[:user_id], username: cookies.signed[:username], dialect: cookies.signed[:dialect])
    end
  end

  def verify_user
    redirect_to root_path unless current_user
  end
end
