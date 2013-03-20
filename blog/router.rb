class Router

  # A Router should be able to accept a block on creation:
  #   router = Router.new do
  #     match '/' => 'controller#action'
  #   end
  def initialize(&block)
    @routes = {}
    instance_eval(&block) if block # instance_eval evaluates a block (or string
                                   # containing Ruby source code) within the
                                   # context of the receiver
  end
  
  # match should map a controller to an action using the options hash
  # e.g. {"/"=>"controller#action"} => @routes["/"] = ["controller", "action"]
  def match(options)
    path, action = options.first
    @routes[path] = action.split("#")
  end
  
  # recognize should return the controller and action corresponding to the path
  # e.g. "/" => ["controller", "action"]
  def recognize(path)
    @routes[path]
  end
end