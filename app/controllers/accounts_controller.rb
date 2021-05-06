class AccountsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.update(verification_token: SecureRandom.hex, verified: false)
      flash[:success] = "Account created, verify your email!"
      AccountMailer.verification_email(@user).deliver!
      redirect_to root_path
    else
      flash[:error] = "There was was something wrong, please check"
      render 'new'
    end
  end

  def verify
    @user = User.find(params[:user_id])
    if @user.verification_token == params[:token]
      @user.update verified: true
      flash[:success] = "Account verified, log in!"
      redirect_to new_session_path
    else
      flash[:error] = "sorry, that went wrong!"
      redirect_to root_path
    end
  end

  private def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
