require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Rating  
  attr_reader :id
  attr_accessor :beer_id, :user_id, :rating

  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  # Initializes a new Beer object
  #
  # options - hash contianing
  #   - id       - int (primary key)
  #   - rating   - int
  #   - beer_id  - int (foriegn key)
  #   - user_id  - int (foriegn key)
  #
  # Returns a Rating object
  def initialize(options = {})
    @id = options["id"]
    @beer_id = options["beer_id"]
    @user_id = options["user_id"]
    @rating = options["rating"]
  end    

  
  # deletes all records from Ratings with beer_id
  #
  # argument beer_id is an Integer
  def self.delete_beer_ratings(beer_id)
    # table_name = self.class.to_s.pluralize.underscore
    BEERDB.execute("DELETE FROM ratings WHERE beer_id = #{beer_id};")    
  end   

  
  # deletes all records from Ratings with user_id
  #
  # argument user_id is an Integer
  def self.delete_user_ratings(user_id)
    # table_name = self.class.to_s.pluralize.underscore
    BEERDB.execute("DELETE FROM ratings WHERE user_id = #{user_id};")    
  end

  # # Adds a *new* row to the "beers" table, using this object's attribute values.
  # #
  # # Calls 'add_to_database' in class Module to do database work
  # # Returns the Integer ID that the database sends back.
  # def self.add(options={})
  #   if options["beer_name"].blank?
  #     return false
  #   else
  #     self.add_to_database(options)
  #   end
  # end
  
  
  # # Updates the database with all values for the beer.
  # #
  # # Returns an empty Array. TODO - This should return something better.
  # def save
  #   if self.valid?
  #     return false
  #   else
  #     BEERDB.execute("UPDATE beers SET beer_name = '#{@beer_name}' WHERE id = #{@id};")
  #   end
  # end
  
  # def valid?
  #   self.beer_name.blank?
  # end
    

  
end