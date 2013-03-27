class ConnectionAdapter
  # execute should execute sql using the @db database connection
  def execute
  end
  
  # columns should return the columns of the database as an array of symbols
  def columns
  end
end

class SqliteAdapter < ConnectionAdapter
  def initialize
    require "sqlite3"
    @db = SQLite3::Database.new(File.dirname(__FILE__) + "/../shared/db/development.sqlite")
  end
end