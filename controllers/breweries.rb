

# -----------------------------------------------------------------------------------------------------------------
# --------------------------------------------- Breweries Menu ----------------------------------------------------

get "/breweries/breweries_menu" do
  erb :"breweries/breweries_menu"
end

# --------------------------------------------- Add Brewery -------------------------------------------------------

get "/breweries/add_breweries" do
  erb :"breweries/add_brewery_form"
end

get "/breweries/add" do
  # new_brewery_id is the Integer returned from the add method
  new_brewery_id = Brewery.add({"brewery_name" => params["brewery_name"], "city" => params["city"]})
  
  if new_brewery_id
    @new_brewery = Brewery.find(new_brewery_id)
    erb :"breweries/brewery_added"
  else
    @error = true
    erb :"breweries/add_brewery_form"
  end
end

# --------------------------------------------- View Breweries ----------------------------------------------------

get "/breweries/view_all_breweries" do
  @all_breweries = Brewery.all
  erb :"breweries/view_breweries"
end

# --------------------------------------------- Edit Breweries ----------------------------------------------------

get "/breweries/edit_brewery_form" do
  @all_breweries = Brewery.all
  erb :"breweries/edit_brewery_form"
end

get "/breweries/edit_brewery_name" do
  @brewery_to_edit = Brewery.find(params["brewery_id"].to_i)
  @brewery_to_edit.brewery_name = params["brewery_name"]
  if @brewery_to_edit.save
    erb :"breweries/brewery_name_updated"
  else
    @error = true
    erb :"breweries/edit_brewery_form"
  end
end

# --------------------------------------------- Delete Users ------------------------------------------------------

get "/users/delete_user_form" do
  @all_users = User.all
  erb :"users/delete_user_form"
end

get "/users/delete_user" do
  @user_to_delete = User.find(params["user_id"].to_i)
  Rating.delete_user_ratings(params["user_id"].to_i)
  if @user_to_delete.delete
    erb :"users/user_deleted"
  else
    @error = true
    erb :"users/delete_user_form"
  end
end







