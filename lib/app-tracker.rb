require "app-tracker/engine"

module ApplicationHelper
	def active_class(attr, tab)
		"active" if attr == tab
	end
end

module AppTracker
	def request_tracker
		user_agent = UserAgent.parse(request.user_agent)
		request_type = formatted_format(request.format)

		os = user_agent.platform.nil? ? ('unknown'):(user_agent.platform)
		browser = user_agent.browser.nil? ? ('unknown'):(user_agent.browser)
		country = Timeout::timeout(10) { Net::HTTP.get_response(URI.parse('http://api.hostip.info/country.php?ip=' + request.remote_ip )).body } rescue "XX"
		country = 'unknown' if country == 'XX'

		AppTracker::Log.create!(
			:os => os,
			:browser => browser,
			:controller => params[:controller],
			:action => params[:controller]+"/"+params[:action],
			:ip => request.remote_ip,
			:format => request_type,
			:country => country,
			:previous_url => request.referrer,
			:current_url => "http://#{request.host}:#{request.port.to_s + request.fullpath}"
			#:created_at => Date.today
			)
	end

	def formatted_format(request_type)
		case request_type
		when 'text/html' || 'html'
			'html'
		when 'text/javascript' || 'javascript'
			'javascript'
		when 'application/json' || 'json'
			'json'
		when 'application/xml' || 'xml'
			'xml'
		else
			'unknown'
		end
	end

end

ActionController::Base.send(:include, AppTracker)
