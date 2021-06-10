class ProfilesController < ApplicationController

  def show
  end

  def update
    current_user.update! profile_picture: params[:user][:profile_picture]
    redirect_to profile_path
  end

end
