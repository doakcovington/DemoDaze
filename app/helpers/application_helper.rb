module ApplicationHelper
    
    def logged_in?
        !!current_user
    end

    def current_user
        @current_user ||= User.find_by(id: session[:id]) if session[:user_id]
    end

    def nav_bar
         if logged_in?
            render partial: '/layouts/logged_in'
        else
            render partial: '/layouts/logged_out'
         end
    end
end
