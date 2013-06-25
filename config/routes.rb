AppTracker::Engine.routes.draw do
	#match "charts" => "logs#charts"
	#match "graphs" => "logs#graphs"
	match "index" => "logs#index"
	root :to => 'logs#dashboard'
end
