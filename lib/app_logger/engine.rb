#require 'rubygems'
require 'will_paginate'
require 'useragent'
require 'geocoder'


module AppLogger
  class Engine < Rails::Engine
    isolate_namespace AppLogger
  end
end
