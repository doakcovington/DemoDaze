class SessionsController < ApplicationController

    def index

    end

    def new
         
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user.try(:authenticate, params[:user][:password])
            session[:user_id] = @user.id
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