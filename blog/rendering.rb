require "erb"

# This Rendering module adds rendering logic to the BasicController
module Rendering

  # returns the name of the controller downcased
  def controller_name
    self.class.name[/^(\w+)Controller$/, 1].downcase
  end

  # returns the path to the appropriate erb, located in a views subdirecetory
  # with the same name of the controller
  # the tests use the erbs in ../../shared/views/
  #   e.g. the home#index action uses ../../shared/views/home/index.erb
  def erb_path(action)
    File.expand_path("../app/views/#{controller_name}/#{action}.erb", __FILE__)
  end

  # renders the action using the erb
  # the binding encapsulates the context of execution, such as instance vars
  # pass the instance binding to ERB#result
  def render_erb(action)
    path = erb_path(action)
    ERB.new(File.read(path)).result(binding)
  end

  # writes the result of the rendered erb to the response body
  def render(action)
    @rendered = true
    response.write render_erb(action)
  end

  # has the action has already been rendered?
  def rendered?
    @rendered
  end

  # overrides the BasicController#process to render the action after it has
  # been processed normally
  def process(action)
    super
    render(action) unless rendered?
  end

end