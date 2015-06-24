require "active_support"
require "active_support/inflector"

# This module will be **extended** in all of my classes. It contains methods
# that will become **class** methods for the class.

module DatabaseClassMethods
  
  
  # Adds a new record to the database.
  #
  #
  # Return an Integer of ID of inserted row.
  def add_to_database(options={})
    table_name = self.to_s.pluralize.underscore
    
    column_names = options.keys
    column_names_for_sql = column_names.join(", ")
    
    values = options.values
    individual_values_for_sql = []
    
    values.each do |value|
      if value.is_a?(String)
        individual_values_for_sql << "'#{value}'"
      else
        individual_values_for_sql << value
      end
    end
    values_for_sql = individual_values_for_sql.join(", ") 

    BEERDB.execute("INSERT INTO #{table_name} (#{column_names_for_sql}) VALUES (#{values_for_sql});")

    BEERDB.last_insert_row_id
  end
  
  
end