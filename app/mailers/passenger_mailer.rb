class PassengerMailer < ApplicationMailer
  default from: "notifications@example.com"

  def booking_email
    @user = params[:user]
    @flight = params[:flight]
    @url = "http://example.com/login"

    mail(to: @user.email, subject: "Welcome to My Awesome Website")
  end
end
