1. include Gem in your GemFile
3. run bundler
2. rails generate app_logger:install
3. rake db:migrate

4. Use

  before_filter :request_logger

	before every action/controller you want to monitor or log


You can view dashboard at

http://yourwebsiteurl.com/logs

it is by default protected by

username : admin
password : password
