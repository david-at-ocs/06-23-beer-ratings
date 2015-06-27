

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







