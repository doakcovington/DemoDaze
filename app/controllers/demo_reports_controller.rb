class DemoReportsController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index
        if params[:bike_id] #nested route show these bikes
            @bike = Bike.find_by_id(params[:bike_id])
            if @bike #if there is a bike
                @demo_reports = @bike.demo_reports #show all demo reports for that bike
            else
                flash[:message] = "That bike doesn't exist"
                @demo_reports = DemoReport.all #show all demo reports
            end
        else #show all bikes
            @demo_reports = DemoReport.all
        end
    end

    def show
       if  @demo_report = DemoReport.find_by_id(params[:id]) #if demo report exists
            @demo_report #display demo report page
       else
            flash[:message] = "That report doesn't exist"
            redirect_to demo_reports_path #redirect to demo report index page
       end
    end

    def new
        if @bike = Bike.find_by_id(params[:id])
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


    def destroy
        @demo_report = DemoReport.find(params[:id])
        @demo_report.destroy
        redirect_to demo_reports_path
    end

    private

    def demo_report_params #strong params
        params.require(:demo_report).permit(:bike_id, :location, :rental_date, :return_date, :report)
    end
end
