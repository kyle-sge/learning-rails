require "rendering"

# This base class provides the base process action available to all controllers
class BasicControllerBase
  attr_accessor :request, :response
end

# The basic controller subclasses the base class so included modules can
# cleanly override the process action
class BasicController < BasicControllerBase
  include Rendering
end