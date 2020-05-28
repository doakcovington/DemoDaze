class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save #if true then log in user
            session[:user_id] = @user.id #adds the user to the session
            redirect_to user_path(@user)
        else #redirect to login page
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id]) #find_by_id allows redirect if there is no id
        redirect_to '/' if !@user #redirects to index if there is no user
    end

    private

    def user_params #strong params
        params.require(:user).permit(:name, :email, :password)
    end
end
