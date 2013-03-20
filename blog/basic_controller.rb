require "rendering"

# This base class provides the base process action available to all controllers
class BasicControllerBase
  attr_accessor :request, :response
  
  # calls the action on the controller subclassing this class
  def process(action)
    send(action)
  end
  
end

# The basic controller subclasses the base class so included modules can
# cleanly override the process action
class BasicController < BasicControllerBase
  include Rendering
end