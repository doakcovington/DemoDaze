class SessionsController < ApplicationController
    def new

    end

    def create

    end

    def destroy
        binding.pry
        session.delete :email
        redirect_to '/'
    end
end