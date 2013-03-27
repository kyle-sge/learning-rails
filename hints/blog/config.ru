require "basic_active_record"
require "basic_controller"
require "front_controller"

Dir['app/models/*.rb'].each{ |f| require f }

run FrontController.new