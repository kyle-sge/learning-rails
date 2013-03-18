require "rack"
require "basic_controller"
require File.expand_path('../../shared/controllers/home_controller', __FILE__)

describe "the home basic controller" do

  before(:each) do
    @controller = HomeController.new
    @controller.stub(:response).and_return(Rack::Response.new)
  end

  it "calls the index action when processing 'index' route" do
    @controller.should_receive(:index)
    @controller.process("index")
  end

  it "returns the correct controller name" do
    @controller.controller_name.should == "home"
  end

  it "generates the correct erb path" do
    @controller.erb_path("index").should == File.expand_path("../../shared/views/home/index.erb", __FILE__)
  end

  it "renders the index action after processing the action" do
    @controller.should_receive(:render)
    @controller.process("index")
  end

end