#app/controllers/survey_evaluations_controller.rb


module AppTracker

	class LogsController < ActionController::Base

		before_filter :authenticate_tracker_admin
		before_filter :log_duration, :except => [:index]
		skip_before_filter :request_tracker
		layout 'tracker'

		unloadable #marks the class for reloading inbetween requests.

		def index
			@logs = AppTracker::Log.order('created_at DESC')
														.paginate(:page => params[:page], :per_page => 50)
		end


		def dashboard
			params[:tab].nil? ? (@attr = 'country'):(@attr = params[:tab])
			if @attr != 'log'
				instance_variable_set("@#{@attr}_chart_logs", AppTracker::Log.chart_data(@attr, @duration))
				instance_variable_set("@#{@attr}_graph_logs", AppTracker::Log.graph_data(@attr, @duration))
			end

			@logs = AppTracker::Log.order('created_at DESC')
														.paginate(:page => params[:page], :per_page => 50)

			if request.format == 'text/html'
				@count_hash = AppTracker::Log.daily_data(@duration)
				@country_hash = AppTracker::Log.chart_data('country', @duration)
				@total_visitors_ips = AppTracker::Log.where("created_at > ?", @duration).pluck('ip')
				@today_visitors_ips = AppTracker::Log.where("DATE(created_at) = DATE(?)", Date.today).pluck('ip')
				@new_visitors_ip = @today_visitors_ips.uniq - AppTracker::Log.where("created_at > ? and DATE(created_at) < ?",  @duration, Date.today).select("DISTINCT(IP)")
			end

			respond_to do |format|
    	  format.html
    	  format.js
  	  end


		end


		private

		def authenticate_tracker_admin
			authenticate_or_request_with_http_basic do |username, password|
				username == "admin" && password == "password"
			end
		end

		def log_duration
			if params[:duration].nil?
					@duration = 7.days.ago.to_date
			else
					@duration =  eval(params[:duration]).ago.to_date
			end
		end

	end

end
