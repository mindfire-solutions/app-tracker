require "app-tracker/engine"

module AppTracker
	def request_tracker
   		user_agent = UserAgent.parse(request.user_agent)
		request_type = formatted_format(request.format)

		user_agent.platform.nil? ? (os = 'unknown'):(os = user_agent.platform)
		user_agent.browser.nil? ? (browser = 'unknown'):(browser = user_agent.browser)


    	AppTracker::Log.create!(
			:os => os,
			:browser => browser,
			:controller => params[:controller],
			:action => params[:controller]+"/"+params[:action],
			:ip => request.remote_ip,
			:format => request_type,
			:country => request.location.country,
			:previous_url => request.referrer,
			:current_url => "http://#{request.host}:#{request.port.to_s + request.fullpath}"
			#:created_at => Date.today
    	)
	end

	def formatted_format(request_type)
	 case request_type
		when 'text/html'
			'html'
 		when 'text/javascript'
			'javascript'
 		when 'application/json'
			'json'
 		when 'application/xml'
			'xml'
		else
			'unknown'
		end
	end

end

ActionController::Base.send(:include, AppTracker)
