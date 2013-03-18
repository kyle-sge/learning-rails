require File.expand_path('../../basic_controller/basic_controller', __FILE__)
require File.expand_path('../../router/router', __FILE__)
require File.expand_path('../../shared/routes', __FILE__)

class FrontController

  # Receives a Rack application and returns a Rack response
  # Uses the Routes object to recognize the controller name and action
  # Processes the action using an instance of the controller
  # Note that Response#write will buffer the writes until Response#finish is
  # called to generate the complete Response object
  def call(env)
  end
  
  # Loads the controller class with the input name
  #   e.g. load_controller_class('home') = HomeController
  # Use Object.const_get to create an instance of the class from its name
  # The tests assumes the controller file is loaded from ../shared/controllers/
  def load_controller_class(name)
  end

end