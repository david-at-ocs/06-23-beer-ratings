#Beer Ratings

A beer rating program where users can rate beer.  Users will be able to choose from a list of beers already in the database or add one if it doesn't exist.

Each beer will also have a brewery, and breweries can/will have many beers.

Beers will also be catagorized by type (IPA, ale, pilsner, etc.)

##Tables
There are at least four tables for this project...

###beers
  - id (primary key)
  - beer_name
  - brewery_id 
  - style_id

###users
  - id (primary key)
  - user name

###breweries
  - id (primary key)
  - brewery_name
  - city
  
###style_families
  - id (primary key)
  - name (i.e. IPA, Belgian Ale)
  
###styles
  - id (primary key)
  - family_id
  - style
  

###ratings
  - id (primary key)
  - user_id
  - beer_id
  - rating
  - date_time stamp???

##'Should'
  - A user can rate multiple beers
  - View average rating of each beer
  - View average rating of each brewery (based on each of that breweries' average beer ratings)


##'Should Not'
  - The same person should not be able to rate the same beer more than once
  - User should not be able to add a beer that already exists in the database
  