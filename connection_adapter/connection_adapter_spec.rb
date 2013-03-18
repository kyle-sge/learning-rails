require "connection_adapter"

describe "the connection adapter" do
  before(:each) do
    @adapter = SqliteAdapter.new
  end

  it "executes sql" do
    row = @adapter.execute("SELECT * FROM posts").first
    row.should == [1, "First Post", "First Body"]
  end

  it "returns an array of symbolized column names" do
    columns = @adapter.columns("posts")
    columns.should == [:id, :title, :body]
  end
end