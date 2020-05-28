module ApplicationHelper
    
    def logged_in?
        !!session[:user_id] #returns true if logged in
    end

    def current_user
        @current_user ||= User.find_by_id(session[:id])
    end

    def nav_bar
         if logged_in?
            render partial: '/layouts/logged_in'
        else
            render partial: '/layouts/logged_out'
         end
    end
end
