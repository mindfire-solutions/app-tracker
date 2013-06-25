require "app_logger/engine"

module AppLogger
  def request_logger
    user_agent = UserAgent.parse(request.user_agent)
		request_type = formatted_format(request.format)

    AppLogger::Log.create!(
			:os => user_agent.platform,
			:browser => user_agent.browser,
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

ActionController::Base.send(:include, AppLogger)
