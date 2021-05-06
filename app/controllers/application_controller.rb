class ApplicationController < ActionController::Base

  helper_method def current_user
    if session[:user_id]
      @_current_user ||= User.find(session[:user_id])
    else
      nil
    end
  end

  helper_method def logged_in?
    !!session[:user_id]
  end

  def authenticate_user!
    if !current_user
      flash[:error] = "You need to be logged in!"
      redirect_to root_path
      return false
    end
    true
  end
end
