require "front_controller"
require "rack"

describe "the front controller" do

  before(:each) do
    @front = FrontController.new
    @request = Rack::Request.new({})
    @request.stub(:path_info).and_return("/")
  end

  it "returns the approriate class for a controller name" do
    klass = @front.load_controller_class("home")
    klass.should == HomeController
  end

  it "creates a Rack request from the incoming Rack environment" do
    Rack::Request.should_receive(:new).and_return(@request)
    response = @front.call({})
  end

  it "instantiates the correct controller" do
    Rack::Request.should_receive(:new).and_return(@request)
    @front.should_receive(:load_controller_class).with("home").and_return(HomeController)
    home_controller = HomeController.new
    HomeController.should_receive(:new).and_return(home_controller)
    response = @front.call({})
  end

  it "calls the correct action" do
    Rack::Request.should_receive(:new).and_return(@request)
    home_controller = HomeController.new
    HomeController.should_receive(:new).and_return(home_controller)
    home_controller.should_receive(:index)
    response = @front.call({})
  end

  it "returns a Rack response" do
    Rack::Request.should_receive(:new).and_return(@request)
    response = @front.call({})
    response.is_a?(Rack::Response).should == true
  end

end