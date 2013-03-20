require "rack/test"
require "basic_active_record"
require "basic_controller"
require "front_controller"
Dir['app/models/*.rb'].each{ |f| require f }

describe "the blog application" do
  include Rack::Test::Methods

  def app
    FrontController.new
  end

  it "renders the home index" do
    get "/"
    last_response.body.should include "Home"
  end

  it "renders the posts index" do
    get "/posts"
    last_response.body.should include "Posts"
  end

  it "renders a list of posts on the posts index" do
    get "/posts"
    Post.all.each do |post|      
      last_response.body.should include post.title
    end
  end

  it "renders individual posts" do
    Post.all.each do |post|
      get "/posts/show?id=#{post.id}"
      last_response.body.should include post.body
    end
  end

end