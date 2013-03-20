require "basic_controller"
require "router"
require "routes"

class FrontController

  # Receives a Rack application and returns a Rack response
  # Uses the Routes object to recognize the controller name and action
  # Processes the action using an instance of the controller
  # Note that Response#write will buffer the writes until Response#finish is
  # called to generate the complete Response object
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new
    
    controller_name, action_name = Routes.recognize(request.path_info)
    
    controller_class = load_controller_class(controller_name)
    
    controller = controller_class.new
    controller.request = request
    controller.response = response
    controller.process(action_name)
    
    response.finish
    response
  end
  
  # Loads the controller class with the input name
  #   e.g. load_controller_class('home') = HomeController
  # Use Object.const_get to create an instance of the class from its name
  # The tests assumes the controller file is loaded from ../shared/controllers/
  def load_controller_class(name)
    require "app/controllers/#{name}_controller"
    Object.const_get(name.capitalize + "Controller")
  end

end