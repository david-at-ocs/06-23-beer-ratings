require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Beer  
  attr_reader :id
  attr_accessor :beer_name

  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
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
    # TODO uncomment lines below later when start with other tables
    # @brewery_id = options["brewery_id"]
    # @style_id = options["style_id"]
  end    
  

  # Adds a *new* row to the "beers" table, using this object's attribute values.
  #
  # Calls 'add_to_database' in class Module to do database work
  # Returns the Integer ID that the database sends back.
  def self.add(options={})
    if options["beer_name"].blank? 
      return false
    else
      self.add_to_database(options)
    end
  end
  
  
  # Updates the database with all values for the beer.
  #
  # Returns an empty Array. TODO - This should return something better.
  def save
    if self.valid?
      return false
    else
      BEERDB.execute("UPDATE beers SET beer_name = '#{@beer_name}' WHERE id = #{@id};")
    end

    # if self.beer_name.blank?
    #   return false
    # else
    #   BEERDB.execute("UPDATE beers SET beer_name = '#{@beer_name}' WHERE id = #{@id};")
    # end
  end
  
  def valid?
    self.beer_name.blank?
  end
  
  
  
  # argument all_ratings is an array of Rating objects
  # 
  def beer_average(all_ratings)
    results = get_ratings(all_ratings)
    average = get_average(results)
    return sprintf('%.2f', average)
    # ave = BEERDB.execute("SELECT AVG(rating) FROM ratings WHERE beer_id = #{@id};")
    # average = ave[0]["AVG(rating)"]
    # return sprintf('%.2f', average)
  end  
  
 
  def get_ratings(all_ratings)
    results = []
    all_ratings.each do |x|
      if x.beer_id == @id
        results << x.rating
      end
    end  
    return results  
  end
  
  def get_average(results)
    results.inject{ |sum, el| sum + el }.to_f / results.size
  end
  
end


























