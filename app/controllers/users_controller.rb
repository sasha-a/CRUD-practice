get '/users/new' do
  erb :'/users/new'
end

# registers user form
post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Oops. Try again."]
    erb :"/_errors"
  end
end

# display a specific user (profile page)
get '/users/:id' do
  ensure_login!
  @user = User.find_by(id: params[:id])
  erb :'/users/show'
end

# return form for editing a user
get '/users/:id/edit' do
  @user = User.find_by(id: params[:id])
end

# update a specific user
put '/users/:id' do
  @user = User.find_by(id: params[:id])
  @restaurants = @user.restaurants
end

# delete user permanently
delete '/users/:id' do
  @user = User.find_by(id: params[:id])
end

get "/users" do
  @users = User.all
  erb :"/users/index"
end
