class BikesController < ApplicationController
    def index

    end

    def show

    end

    def new
        @bike = Bike.new
        @bike.build_dealer
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

    def bike_params
        params.require(:bike).permit(:name, :category, :dealer_id, dealer_attributes:[:name])
    end
end
