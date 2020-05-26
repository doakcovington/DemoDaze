class ApplicationController < ActionController::Base

    private

    def logged_in?
        !!current_user
    end

    def current_user
        @current_user ||= User.find_by_id(session[:id])
    end
end
