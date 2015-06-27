

# -----------------------------------------------------------------------------------------------------------------
# --------------------------------------------- Breweries Menu ----------------------------------------------------

get "/breweries/breweries_menu" do
  erb :"breweries/breweries_menu"
end

# --------------------------------------------- Add Brewery ----------------------------------------------------------

get "/breweries/add_breweries" do
  erb :"breweries/add_brewery_form"
end

get "/breweries/add" do
  # new_brewery_id is the Integer returned from the add method
  new_breweriy_id = Brewery.add({"brewery_name" => params["brewery_name"], "city" => params["city"]})
  
  if new_breweriy_id
    @new_brewery = Brewery.find(new_brewery_id)
    erb :"breweries/brewery_added"
  else
    @error = true
    erb :"breweries/add_brewery_form"
  end
end

# --------------------------------------------- View Users --------------------------------------------------------

get "/users/view_all_users" do
  @all_users = User.all
  erb :"users/view_users"
end

# --------------------------------------------- Edit Users --------------------------------------------------------

get "/users/edit_users_form" do
  @all_users = User.all
  erb :"users/edit_users_form"
end

get "/users/edit_user_name" do
  @user_to_edit = User.find(params["user_id"].to_i)
  @user_to_edit.user_name = params["user_name"]
  if @user_to_edit.save
    erb :"users/user_name_changed"
  else
    @error = true
    erb :"users/edit_user_form"
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







