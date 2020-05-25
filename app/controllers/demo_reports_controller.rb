class DemoReportsController < ApplicationController
    def index
        @demo_reports = DemoReport.all
    end

    def show
        @demo_report = DemoReport.find_by_id(params[:id])
    end

    def new
        @bike = Bike.find_by_id(params[:bike_id])
        @demo_report = @bike.demo_reports.build
    end

    def create
        @demo_report = DemoReport.new(demo_report_params)
        @demo_report.user_id = session[:user_id]
        if @demo_report.save
            redirect_to demo_report_path(@demo_report)
        else
            #raise params.inspect
            render :new
        end
    end

    private

    def demo_report_params
        params.require(:demo_report).permit(:bike_id, :location, :rental_date, :return_date, :report)
    end
end
