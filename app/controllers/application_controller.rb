class ApplicationController < ActionController::Base

    private

    def logged_in?
        !!current_user
    end

    def current_user
        @current_user ||= User.find_by(id: session[:id]) if session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in? #redirects to home page if logged_in? is false
    end
end
