
get "/beer/beers_menu" do
  erb :"beers/beers_menu"
end

get "/beer/add_beers" do
  erb :"beers/add_beer_form"
end

get "/beer/add" do
  new_beer_id = Beer.add({"name" => params["name"]) # TODO add some more stuff to this hash later
  
  # new_beer_id is the Integer returned from the add method
  if new_beer_id
    @new_beer = Beer.find_as_object(new_beer_id)
    erb:"beer_added" # TODO still need to add this file
  else
    @error = true
    erb:"add_beer_form"
  end
end