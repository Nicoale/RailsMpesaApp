class SessionsController<ApplicationController
    def create
        user=User
        .find_by (id_number: params["user"]["id_number"])
        .try(:authenticate, params["user"]["password"])
    
    if user session[:user.id] =user.id #assuming that its gonna pick an id from the databasethat is uniquely assigned to the user and equate it to the successfully logged user 
        render json:{
            status: :created,
            logged_in: true,
            user: user
        }
    else
        render json: { status: 401 }    
    end
end
