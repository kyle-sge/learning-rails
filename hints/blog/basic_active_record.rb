require "connection_adapter"
require "active_model"

module BasicActiveRecord
  class Base
    @@connection = SqliteAdapter.new

    # a ActiveRecord object should be able to create an object with attributes
    def initialize
    end

    # table_name should return the name of the table in the database
    def self.table_name
    end

    # columns should return the columns of the table as an array of symbols
    def self.columns
    end

    # map_values_to_columns should create a hash of column name to column value
    def self.map_values_to_columns
    end

    # method_missing should return an attribute if the method name is a column
    def method_missing
    end

    # find_by_sql should instantiate each result of the executed sql and return
    # the model instances as an array
    def self.find_by_sql
    end

    # find should instantiate and return the result corresponding to the id if
    # it exists
    def self.find
    end

    # all should instantiate each row of the table and return the model
    # instances as an array
    def self.all
    end

    # override Object#id
    def id
    end

  end
end