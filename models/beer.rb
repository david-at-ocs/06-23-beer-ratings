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
    @brewery_id = options["brewery_id"]
    # TODO uncomment lines below later when start with other tables
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
      BEERDB.execute("UPDATE beers SET beer_name = '#{@beer_name}', brewery_id = #{@brewery_id} WHERE id = #{@id};")
    end
  end
  
  def valid?
    self.beer_name.blank?
  end
  
  # def single_beer_average
  #   ave = BEERDB.execute("SELECT AVG(rating) FROM ratings WHERE beer_id = #{@id};")
  #   average = ave[0]["AVG(rating)"]
  #   if average == nil
  #     return 0
  #   else
  #     return sprintf('%.2f', average)
  #   end
  # end
  
  
  # argument all_ratings is an array of Rating objects
  # 
  # Returns average rating of a beer as a float
  def beer_average(all_ratings)
    results = get_ratings(all_ratings)
    if results == 0
      return "--"
    else
      average = get_average(results)
      return sprintf('%.2f', average)
    end
  end  
  
  # pushes all ratings for single beer_id into an Array
  #
  # Returns Array of ratings as integers
  def get_ratings(all_ratings)
    results = []
    all_ratings.each do |x|
      if x.beer_id == @id
        results << x.rating
      end
    end
    if no_ratings?(results)
      return 0
    else
      return results
    end
  end
  
  # Returns the average of array of integers as a float
  def get_average(results)
    results.inject{ |sum, el| sum + el }.to_f / results.size
  end
  
  # gets all of single beer's ratings and the name of each person who rated the beer
  # Returns Array of Hashes
  def get_beer_ratings
    BEERDB.execute("SELECT beers.beer_name, ratings.rating, users.user_name, breweries.brewery_name FROM ratings JOIN beers ON ratings.beer_id = beers.id JOIN users ON ratings.user_id = users.id JOIN breweries ON beers.brewery_id = breweries.id WHERE beers.id = #{id}")
  end
  
  # Returns true if a beer has no ratings
  def no_ratings?(results)
    if results.length == 0
      return true
    else
      return false  
    end
  end
end


























