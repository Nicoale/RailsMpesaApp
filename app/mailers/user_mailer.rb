class UserMailer < ApplicationMailer
     default from: 'mpesanotifs@example.com'
 
    def welcome_email
      @user = params[:user]
      @url  = 'http://localhost:3000/users/new'
      mail(to: @user.email, subject: 'Welcome to My MpesaApp  Site')
    end
end
