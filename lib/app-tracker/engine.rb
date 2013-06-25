#require 'rubygems'
require 'will_paginate'
require 'useragent'
require 'geocoder'


module AppTracker
  class Engine < Rails::Engine
    isolate_namespace AppTracker
  end
end
