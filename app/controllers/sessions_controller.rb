class SessionsController < ApplicationController

    def index

    end

    def new
         
    end

    def create
        @user = User.find_by(email: params[:user][:email]) #finds the user
        if @user.try(:authenticate, params[:user][:password]) #if user has the correct password
            session[:user_id] = @user.id #login user
            redirect_to user_path(@user.id) #redirect to user show page
        else
            flash[:error] = "The login was invalid. Please try again."
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end
end