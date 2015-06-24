
# --------------------------------------------- Beers Menu --------------------------------------------------------

get "/beer/beers_menu" do
  erb :"beers/beers_menu"
end

# --------------------------------------------- Add Beer ----------------------------------------------------------

get "/beer/add_beers" do
  erb :"beers/add_beer_form"
end

get "/beer/add" do
  # new_beer_id is the Integer returned from the add method
  new_beer_id = Beer.add({"beer_name" => params["beer_name"]}) # TODO add some more stuff to this hash later
  
  if new_beer_id
    @new_beer = Beer.find_as_object(new_beer_id)
    erb :"beers/beer_added"
  else
    @error = true
    erb :"beers/add_beer_form"
  end
end

# --------------------------------------------- View Beers --------------------------------------------------------

get "/beer/view_all_beers" do
  @all_beers = Beer.all
  erb :"beers/view_beers"
end