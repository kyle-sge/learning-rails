class ConnectionAdapter
  # execute should execute sql using the @db database connection
  def execute(sql)
    @db.execute(sql)
  end
  
  # columns should return the columns of the database as an array of symbols
  def columns(table_name)
    @db.table_info(table_name).map { |info| info["name"].to_sym }
  end
end

class SqliteAdapter < ConnectionAdapter
  def initialize
    require "sqlite3"
    @db = SQLite3::Database.new(File.dirname(__FILE__) + "/../shared/db/development.sqlite")
  end
end