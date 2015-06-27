

# -----------------------------------------------------------------------------------------------------------------
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
  # TODO add some more stuff to this hash later
  new_beer_id = Beer.add({"beer_name" => params["beer_name"], "brewery_id" => params["brewery_id"]})
  @all_breweries = Brewery.all
  if new_beer_id
    @new_beer = Beer.find(new_beer_id)
    erb :"beers/beer_added"
  else
    @error = true
    erb :"beers/add_beer_form"
  end
end

# --------------------------------------------- View Beers --------------------------------------------------------

get "/beer/view_all_beers" do
  @all_beers = Beer.all
  @all_ratings = Rating.all
  erb :"beers/view_beers"
end


# --------------------------------------------- View Beer Rating ---------------------------------------------------

get "/beer/view_beer_rating" do
  @all_beers = Beer.all
  erb :"beers/view_beer_rating"
end

get "/beer/view_rating" do
  @beer_to_view = Beer.find(params["beer_id"].to_i)
  @all_ratings = Rating.all                             #  <=  TODO See if I can handle these two 
  @average = @beer_to_view.beer_average(@all_ratings)   #  <= lines using 'get_beer_ratings' on the next line
  @beer_ratings = @beer_to_view.get_beer_ratings
  erb :"beers/view_rating"
end

# --------------------------------------------- Edit Beers --------------------------------------------------------

get "/beer/edit_beers" do
  @all_beers = Beer.all
  erb :"beers/edit_beer_form"
end

get "/beer/edit_beer_name" do
  @beer_to_edit = Beer.find(params["beer_id"].to_i)
  @beer_to_edit.beer_name = params["beer_name"]
  if @beer_to_edit.save
    erb :"beers/beer_name_changed"
  else
    @error = true
    erb :"beers/edit_beer_form"
  end
end

# --------------------------------------------- Delete Beers ------------------------------------------------------

get "/beer/delete_beer_form" do
  @all_beers = Beer.all
  erb :"beers/delete_beer_form"
end

get "/beer/delete_beer" do
  @beer_to_delete = Beer.find(params["beer_id"].to_i)
  Rating.delete_beer_ratings(params["beer_id"].to_i)
  if @beer_to_delete.delete
    erb :"beers/beer_deleted"
  else
    @error = true
    erb :"beers/edit_beer_form"
  end
end







