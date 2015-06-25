require "active_support"
require "active_support/core_ext/object/blank"
require "sinatra"
require "sinatra/reloader"
require "pry"

# -------------------------------------------------------------------------------------------------------------------
# SQL/Database
require "sqlite3"
require_relative "database_setup.rb"

# Models
require_relative "models/beer.rb"
require_relative "models/user.rb"
require_relative "models/rating.rb"


# Controllers
require_relative "controllers/main.rb"
require_relative "controllers/beers.rb"
require_relative "controllers/users.rb"