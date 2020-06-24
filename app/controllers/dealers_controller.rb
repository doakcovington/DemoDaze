class DealersController < ApplicationController
    def index
        @dealers = Dealer.alpha #sorts delears in alphabetical order
    end

    def show
        if  @dealer = Dealer.find_by_id(params[:id]) #if demo report exists
            @dealer #display dealer page
       else
            flash[:message] = "That dealer doesn't exist"
            redirect_to bikes_path #redirect to demo report index page
       end
    end
end
