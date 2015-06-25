

# -----------------------------------------------------------------------------------------------------------------
# --------------------------------------------- Users Menu --------------------------------------------------------

get "/users/users_menu" do
  erb :"users/users_menu"
end

# --------------------------------------------- Add User ----------------------------------------------------------

get "/users/add_users" do
  erb :"users/add_user_form"
end

get "/users/add" do
  # new_beer_id is the Integer returned from the add method
  new_user_id = User.add({"user_name" => params["user_name"]})
  
  if new_user_id
    @new_user = User.find(new_user_id)
    erb :"users/user_added"
  else
    @error = true
    erb :"users/add_user_form"
  end
end

# --------------------------------------------- View Users --------------------------------------------------------

get "/beer/view_all_beers" do
  @all_users = User.all
  erb :"beers/view_beers"
end

# --------------------------------------------- Edit Users --------------------------------------------------------

get "/beer/edit_beers" do
  @all_beers = User.all
  erb :"beers/edit_beer_form"
end

get "/beer/edit_beer_name" do
  @beer_to_edit = User.find(params["beer_id"].to_i)
  @beer_to_edit.beer_name = params["beer_name"]
  if @beer_to_edit.save
    erb :"beers/beer_name_changed"
  else
    @error = true
    erb :"beers/edit_beer_form"
  end
end

# --------------------------------------------- Delete Users ------------------------------------------------------

get "/beer/delete_beer_form" do
  @all_beers = User.all
  erb :"beers/delete_beer_form"
end

get "/beer/delete_beer" do
  @beer_to_delete = User.find(params["beer_id"].to_i)
  if @beer_to_delete.delete
    erb :"beers/beer_deleted"
  else
    @error = true
    erb :"beers/edit_beer_form"
  end
end







