class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if !user
      flash[:error] = "User not found or password incorrect"
      redirect_to new_session_path
    elsif !user.verified
      flash[:error] = "User not verified!"
      AccountMailer.verification_email(user).deliver!
      redirect_to new_session_path
    elsif user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in. Welcome!"
      redirect_to root_path
    else
      flash[:error] = "User not found or password incorrect"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out. See ya!"
    redirect_to root_path
  end

end
