require "connection_adapter"
require "active_model"

module BasicActiveRecord
  class Base
    @@connection = SqliteAdapter.new

    # a ActiveRecord object should be able to create an object with attributes
    def initialize(attributes={})
      @attributes = attributes
    end

    # table_name should return the name of the table in the database
    def self.table_name
      name.downcase + "s"
    end

    # columns should return the columns of the table as an array of symbols
    def self.columns
      @@connection.columns(table_name)
    end

    # map_values_to_columns should create a hash of column name to column value
    def self.map_values_to_columns(values)
      Hash[columns.zip(values)]
    end

    # method_missing should return an attribute if the method name is a column
    def method_missing(name, *args)
      if self.class.columns.include?(name)
        @attributes[name]
      else
        super
      end
    end

    # find_by_sql should instantiate each result of the executed sql and return
    # the model instances as an array
    def self.find_by_sql(sql)
      rows = @@connection.execute(sql)
      rows.map do |row|
        attributes = map_values_to_columns(row)
        new(attributes)
      end
    end

    # find should instantiate and return the result corresponding to the id if
    # it exists
    def self.find(id)
      find_by_sql("SELECT * FROM #{table_name} WHERE id = #{id.to_i} LIMIT 1").first
    end

    # all should instantiate each row of the table and return the model
    # instances as an array
    def self.all
      find_by_sql("SELECT * FROM #{table_name}")
    end

    def id
      @attributes[:id]
    end

  end
end