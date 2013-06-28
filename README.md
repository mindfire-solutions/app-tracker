App-Tracker
======
App-Tracker is a basic traffic tracking gem. The idea building the gem was to create a system where one can log and evaluate the traffic coming to the website according to the needs. One can analyze the recorded data by having a look at graphs and charts. User can also view the distribution of user according to the regions.

Below are instruction to setup your application:

Prerequisites
-------------
* Ruby 1.9 or higher
* Ruby on Rails 3.1.3 or higher


Getting Started
---------------
App-Tracker is a mountable engine created in rails 3.1.3 environment. It can be integrated to any rails application > 3.1.3. The dashboard can be seen only by the admin.

Below are instruction to setup survey in your application:

 Add the survey gem to your Gemfile:
```ruby
gem 'app-tracker', :git => 'git://github.com/mindfire-solutions/app-tracker'
```

* Run the bundler.
```console
bundle install
```
* Install the gem by running following command in the terminal
```console
rails generate app_tracker:install
```

* Run the migrations.
```console
rake  db:migrate
```

* Add before_filter according to neeed to controllers or action that you want to monitor.
```ruby
before_filter :request_tracker
```
  
* You can view dashboard at
```ruby
http://yourwebsiteurl.com/logs
```

*Dashboard is by default protected by
```ruby
username : admin
password : password
```

*That's it you are ready to track and view stats!!.. :).