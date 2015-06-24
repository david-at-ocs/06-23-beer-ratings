# Load/create our database for this program.
# This is the tunnel to the db
BEERDB = SQLite3::Database.new("beer_ratings.db")

# Make the tables, if they don't already exist.
BEERDB.execute("CREATE TABLE IF NOT EXISTS beers (id INTEGER PRIMARY KEY, beer_name TEXT NOT NULL, brewery_id INTEGER NOT NULL, style_id INTEGER NOT NULL);")

# Get results as an Array of Hashes.
MOVIEDB.results_as_hash = true
