require "rack/test"
require "hello_world"

describe "the hello world application" do
  include Rack::Test::Methods

  def app
    HelloWorld.new
  end

  it "says 'Hello World'" do
    get "/"
    last_response.body.should == "Hello World"
  end
end