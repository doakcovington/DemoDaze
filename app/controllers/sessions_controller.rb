class SessionsController < ApplicationController

    def index

    end

    def new
         
    end

    def create
        @user = User.find_by(email: params[:user][:email]) #find user
   
        #if we find something & they have the right password
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user.id)
        else
           flash[:message] = "Password was invalid. Please try again."
           redirect_to login_path
        end
     end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end
end