class SessionsController < ApplicationController

    def new
        
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "Succesfully logged in"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "No user exists with that email and password."
            render 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:success] = "User logged out."
        redirect_to root_path
    end

end