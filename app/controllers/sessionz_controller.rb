class SessionzController < ApplicationController
    def new
    end
    def create
        user + User.find_by(phone_number:session_params[:phone_number])
        if user && user.authenticate(session_params[:password])
        else 
            flash.now[:error] ='Invalid phone number/password'
            render 'new'
        end
        def destroy
            logout
            redirect_to_root_path
        end
    end
    private
    def session_params
       params.require(:session).permit(:phone_number, :password)
    end

end
