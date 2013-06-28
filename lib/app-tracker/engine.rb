#require 'rubygems'
require 'will_paginate'
require 'useragent'


module AppTracker
  class Engine < Rails::Engine
    isolate_namespace AppTracker
  end
end
