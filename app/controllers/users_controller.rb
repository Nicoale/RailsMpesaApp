class UsersController < ApplicationController
    def new 
    end
    def create
        @user = User.new(user_params)
        respond_to do |format|
        if @user.save
          UserMailer.with(user: @user).welcome_email.deliver_later
          format.html { redirect_to(@user, notice: 'Your account was successfully created.') }
          format.json { render json: @user, status: :created, location: @user }
          
          redirect_to user_path(@user)
        else
          render 'new'
        end
      end
      def show
        @user = User.find(params[:id])
      end
    
      private
      def user_params
        params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :phone_number, :id_number)
      end
end
