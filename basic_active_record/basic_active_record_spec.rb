require "basic_active_record"
require File.expand_path('../../shared/models/post', __FILE__)

describe "the post basic active record model" do

  it "uses the connection adapter" do
    Post.class_variable_defined?('@@connection').should == true
    Post.class_eval{class_variable_get('@@connection')}.class.should == SqliteAdapter
  end

  it "pluralizes model name for table name" do
    table_name = Post.table_name
    table_name.should == "posts"
  end

  it "returns the correct columns" do
    columns = Post.columns
    columns.should == [:id, :title, :body]
  end

  it "maps values to columns" do
    values = [1, "First Post", "First Body"]
    mapped_attributes = {:id => 1, :title => "First Post", :body => "First Body"}
    attributes = Post.map_values_to_columns(values)
    attributes.should == mapped_attributes
  end

  it "initializes post with attributes" do
    post = Post.new(:title => "A Post", :body => "A Body")
    post.title.should == "A Post"
    post.body.should == "A Body"
  end

  it "finds posts by sql" do
    posts = Post.find_by_sql("SELECT * FROM posts")
    posts.map { |post| post.is_a?(Post).should be_true }
  end

  it "finds the post with specified id" do
    post = Post.find(2)
    post.title.should == "Second Post"
    post.body.should == "Second Body"
  end

  it "finds all of the posts" do
    posts = Post.all
    posts.size.should == 3
  end

end