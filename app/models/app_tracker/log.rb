module AppTracker

	class Log < ActiveRecord::Base

		attr_accessible :action, :browser, :controller, :ip, :os, :previous_url, :current_url, :format, :country, :created_at
		#Chart Data
		def self.chart_data(attribute, duration)
				range = 15.days
				self.where("created_at > ?", duration).group(attribute).count
		end

		#Graph Data
		def self.graph_data(attribute, duration)
			attributes_hash = {}
			self.group(attribute).each do |attr_rcrd|
				(attribute == 'format') ? (attr_type = attr_rcrd.format):(attr_type =  attr_rcrd.send(attribute))
				attributes_hash[attr_type] = daily_records_counts_array_in_past_n_days(attr_type, attribute, duration)
			end
			attributes_hash
		end

		#Called from Graph data to return has for particular attribute
		def self.daily_records_counts_array_in_past_n_days(attr_type, attribute, duration)
			count_hash = {}
			counts = self.where(:"#{attribute}" => attr_type).where("created_at > ?", duration).order('created_at DESC').group('Date(created_at)').count
			(duration..Date.today).each do |date|
				total_counts = counts[date]
				total_counts = counts[date.strftime] if total_counts.nil?
				total_counts.nil? ? (count_hash[date] = 0) : (count_hash[date] = total_counts)
			end
			count_hash
		end

		def self.daily_data(duration)
			counts_hash = {}
			counts = self.where("created_at > ?", duration).group('Date(created_at)').count
			(duration..Date.today).each do |date|
				total_counts = counts[date]
				total_counts = counts[date.strftime] if total_counts.nil?
			  total_counts.nil? ? (counts_hash[date] = 0) : (counts_hash[date] = total_counts)
			end
			counts_hash
		end

	end
	#Class ends here

end
#module ends here 
