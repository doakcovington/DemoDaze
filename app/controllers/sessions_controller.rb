class SessionsController < ApplicationController

    def index

    end

    def new
         
    end

    def create 
        if params[:provider]
            @user = User.omniauth_user(auth)

            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @user = User.find_by(email: params[:user][:email]) #find user
   
            #if we find user & they have the right password
            if @user && @user.authenticate(params[:user][:password])
              session[:user_id] = @user.id #logs the user in
              redirect_to user_path(@user.id)
            else
               flash[:message] = "Login was invalid. Please try again."
               redirect_to login_path
            end
            
        end
     end

    def destroy
        session.delete(:user_id)
        flash[:message] = "You have been logged out."
        redirect_to root_path
    end

    private
    def auth
        request.env['omniauth.auth']
    end
end