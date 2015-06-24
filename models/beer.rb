require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class Beer
  
  # Initializes a new Beer object
  #
  # options - hash contianing
  #   - id          - int (primary key)
  #   - beer_name   - string
  #   - brewery_id  - int (foriegn key)
  #   - style_id    - int (foriegn key)
  #
  # Example:
  #   Movie.new({"id" => 4, "name" => "Tank 7", "brewery_id" => 7, "style_id" => 3})
  #
  # Returns a Beer object
  def initialize(options = {})
    @id = options["id"]
    @beer_name = options["beer_name"]
    @brewery_id = options["brewery_id"]
    @style_id = options["style_id"]
  end    
  

  # Adds a *new* row to the "beers" table, using this object's attribute values.
  #
  # Calls 'add_to_database' in class Module to do database
  # Returns the Integer ID that the database sends back.
  def self.add(options={})
    # if either of the foriegn keys is 0, returns false and won't add to database (TODO not sure if this is needed)
    if options["brewery_id"] == 0 || options["style_id"] == 0
      return false
    # if beer_name blank, returns false and won't add to database (TODO not sure if this is needed)
    elsif options["beer_name"].blank? 
      return false
    else
      self.add_to_database(options)
    end
  end
  
  
  
  
end