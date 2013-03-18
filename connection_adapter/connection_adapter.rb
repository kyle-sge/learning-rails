class ConnectionAdapter

end

class SqliteAdapter < ConnectionAdapter
  def initialize
    require "sqlite3"
    @db = SQLite3::Database.new(File.dirname(__FILE__) + "/../shared/db/development.sqlite")
  end
end