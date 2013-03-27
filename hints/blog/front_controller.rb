require "basic_controller"
require "router"
require "routes"

class FrontController

  # Receives a Rack application and returns a Rack response
  # Uses the Routes object to recognize the controller name and action
  # Processes the action using an instance of the controller
  # Note that Response#write will buffer the writes until Response#finish is
  # called to generate the complete Response object
  def call
  end
  
  # Loads the controller class with the input name
  #   e.g. load_controller_class('home') = HomeController
  # Use Object.const_get to create an instance of the class from its name
  # The tests assumes the controller file is loaded from ../shared/controllers/
  def load_controller_class
  end

end