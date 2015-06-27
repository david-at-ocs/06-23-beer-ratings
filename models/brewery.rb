require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Brewery  
  attr_reader :id
  attr_accessor :brewery_name, :city

  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  # Initializes a new User object
  #
  # options - hash contianing
  #   - id          - int (primary key)
  #   - user_name   - string
  #
  # Example:
  #   Movie.new({"id" => 4, "user_name" => "David Gardetti"})
  #
  # Returns a User object
  def initialize(options = {})
    @id = options["id"]
    @brewery_name = options["brewery_name"]
    @city = options["city"]
  end    
  

  # Adds a *new* row to the "users" table, using this object's attribute values.
  #
  # Calls 'add_to_database' in class Module to do database work
  # Returns the Integer ID that the database sends back.
  def self.add(options={})
    if options["brewery_name"].blank? 
      return false
    else
      self.add_to_database(options)
    end
  end
  
  
  # Updates the database with all values for the user.
  #
  # Returns an empty Array. TODO - This should return something better.
  def save
    if self.valid?
      return false
    else
      BEERDB.execute("UPDATE brewery SET brewery_name = '#{@brewery_name}', city = '#{@city}' WHERE id = #{@id};")
    end
  end
  
  def valid?
    self.brewery_name.blank?
  end
    
  
  
end