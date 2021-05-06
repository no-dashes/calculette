class AccountMailer < ApplicationMailer
  default from: 'home@calculette.com'

  def verification_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Calculette')
  end
end

__END__

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
