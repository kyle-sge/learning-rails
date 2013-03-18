require "router"

describe "the router" do
  it "matches a route" do
    router = Router.new
    router.match "/" => "controller#action"
    router.recognize("/").should == ["controller", "action"]
  end

  it "matches a route using domain specific language" do
    router = Router.new do
      match "/" => "controller#action"
    end
    router.recognize("/").should == ["controller", "action"]
  end
end