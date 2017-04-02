class SessionsController < ApplicationController

  def create
    cookies.signed[:username].blank? ? set_cookies : reset_session_cookies

    redirect_to messages_path
  end

  def destroy
    reset_session_cookies
    redirect_to new_sessions_path
  end

  private

  def reset_session_cookies
    $redis.del("user:#{cookies.signed[:user_id]}")
    cookies.clear
  end

  def set_cookies
    if !params[:session][:username].blank? && !params[:session][:dialect].blank?
      cookies.signed[:user_id] = SecureRandom.uuid
      cookies.signed[:username] = params[:session][:username]
      cookies.signed[:dialect] = params[:session][:dialect]
      $redis.hmset("user:#{cookies.signed[:user_id]}", "username", cookies.signed[:username],
                   "joined_at", Time.now.to_i)
    else
      flash[:error] = "Please provide a user name"
    end
  end

end
