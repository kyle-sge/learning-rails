class Router

  # A Router should be able to accept a block on creation:
  #   router = Router.new do
  #     match '/' => 'controller#action'
  #   end
  def initialize
  end
  
  # match should map a controller to an action using the options hash
  # e.g. {"/"=>"controller#action"} => @routes["/"] = ["controller", "action"]
  def match
  end
  
  # recognize should return the controller and action corresponding to the path
  # e.g. "/" => ["controller", "action"]
  def recognize
  end
end