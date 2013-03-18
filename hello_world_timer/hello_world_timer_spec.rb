require "rack/test"
require "hello_world_timer"
require File.expand_path('../../hello_world/hello_world', __FILE__)

describe "the hello world application" do
  include Rack::Test::Methods

  def app
    HelloWorldTimer.new(HelloWorld.new)
  end

  it "wraps the HelloWorld application" do
    get "/"
    last_response.body.should include "Hello World"
  end

  it "contains the time it took to process the HelloWorld request in the body" do
    get "/"
    last_response.body.should =~ /\d+/
  end

end