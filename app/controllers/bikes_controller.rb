class BikesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @bike = Bike.new
        @bike.build_dealer
    end
    
    def index
        @bikes = Bike.order_by_number_of_demo_reports
    end

    def show
        if  @bike = Bike.find_by_id(params[:id]) #if demo report exists
            @bike #display demo report page
       else
            flash[:message] = "That bike doesn't exist"
            redirect_to bikes_path #redirect to demo report index page
       end
    end

    def create
        @bike = Bike.new(bike_params)
        @bike.user_id = session[:user_id]
        if @bike.save
            redirect_to bike_path(@bike)
        else
            render :new
        end
    end

    private

    def bike_params #strong params
        params.require(:bike).permit(:name, :category, :dealer_id, dealer_attributes: [:name])
    end
end
