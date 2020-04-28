module SessionzHelper
    def login(user)
        session[:user_id]=user.user_id
    end
    def current_user 
       @current_user ||= User.find_by(id:session[:user_id])
    end
    def destroy
        logout
        redirect to root_path
    end 
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
