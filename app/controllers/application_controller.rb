class ApplicationController < ActionController::Base
    
     helper_method :current_user, :logged_in? #gives access to helper methods in views


    def logged_in?
        !!session[:user_id]
    end
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in? #redirects to home page if logged_in? is false
    end
end
