require File.expand_path('../../basic_controller/rendering', __FILE__)

class BasicControllerBase
  attr_accessor :request, :response
  
end

class BasicController < BasicControllerBase
  include Rendering
end