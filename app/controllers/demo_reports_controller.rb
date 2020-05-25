class DemoReportsController < ApplicationController
    def index
        @demo_reports = DemoReport.all
    end

    def show

    end

    def new
        @demo_report = DemoReport.new
        # @bike = Bike.find_by_id(params[:bike_id])
        # @demo_report = @bike.demo_reports.build
    end

    def create

    end
end
