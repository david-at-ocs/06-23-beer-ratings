# Load/create our database for this program.
# This is the tunnel to the db
BEERDB = SQLite3::Database.new("beer_ratings.db")

# Make the tables, if they don't already exist.
# TODO uncomment line below this when statring with other tables
# BEERDB.execute("CREATE TABLE IF NOT EXISTS beers (id INTEGER PRIMARY KEY, beer_name TEXT NOT NULL, brewery_id INTEGER NOT NULL, style_id INTEGER NOT NULL);")

# TODO delete line below this when starting with other tables
BEERDB.execute("CREATE TABLE IF NOT EXISTS beers (id INTEGER PRIMARY KEY, beer_name TEXT NOT NULL, brewery_id INTEGER);")
BEERDB.execute("CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, user_name TEXT NOT NULL);")
BEERDB.execute("CREATE TABLE IF NOT EXISTS ratings (id INTEGER PRIMARY KEY, user_id INTEGER NOT NULL, beer_id INTEGER NOT NULL, rating INTEGER NOT NULL);")
BEERDB.execute("CREATE TABLE IF NOT EXISTS breweries (id INTEGER PRIMARY KEY, brewery_name TEXT NOT NULL, city TEXT);")

# Get results as an Array of Hashes.
BEERDB.results_as_hash = true
