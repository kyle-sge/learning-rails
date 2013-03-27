require "erb"

# This Rendering module adds rendering logic to the BasicController
module Rendering

  # returns the name of the controller downcased
  def controller_name
  end

  # returns the path to the appropriate erb, located in a views subdirecetory
  # with the same name of the controller
  # the tests use the erbs in ../../shared/views/
  #   e.g. the home#index action uses ../../shared/views/home/index.erb
  def erb_path
  end

  # renders the action using the erb
  # the binding encapsulates the context of execution, such as instance vars
  # pass the instance binding to ERB#result
  def render_erb
  end

  # writes the result of the rendered erb to the response body
  def render
  end

  # has the action has already been rendered?
  def rendered?
  end

  # overrides the BasicController#process to render the action after it has
  # been processed normally
  def process
  end

end