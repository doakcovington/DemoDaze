module DemoReportsHelper

    def header(demo_report)
        if params[:bike_id] 
             content_tag(:h1, "Create A New Demo Report for #{@demo_report.bike.name}")
        else
            content_tag(:h1, "Create A New Demo Report")        
        end  
    end
end
