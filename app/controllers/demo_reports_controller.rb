class DemoReportsController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index
        if params[:bike_id] #nested route show these bikes
            @bike = Bike.find_by_id(params[:bike_id])
            @demo_reports = @bike.demo_reports
        else #show all bikes
            @demo_reports = DemoReport.all
        end
    end

    def show
        @demo_report = DemoReport.find_by_id(params[:id])
    end

    def new
        if @bike = Bike.find_by_id(params[:bike_id])
            @demo_report = @bike.demo_reports.build
        else
            @demo_report = DemoReport.new
        end
    end

    def create
        @demo_report = DemoReport.new(demo_report_params)
        @demo_report.user_id = session[:user_id] #assigns the demo report to the
        if @demo_report.save
            redirect_to demo_report_path(@demo_report)
        else
            #raise params.inspect
            render :new
        end
    end

    def edit
        @demo_report = DemoReport.find(params[:id])
    end

    def update
        @demo_report = DemoReport.find(params[:id])
        @demo_report.update(demo_report_params)
    
        redirect_to bike_path(@demo_report)
      end

    private

    def demo_report_params #strong params
        params.require(:demo_report).permit(:bike_id, :location, :rental_date, :return_date, :report)
    end
end
