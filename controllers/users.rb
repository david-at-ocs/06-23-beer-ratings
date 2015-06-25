

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
    binding.pry
    erb :"users/user_added"
  else
    @error = true
    erb :"users/add_user_form"
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







