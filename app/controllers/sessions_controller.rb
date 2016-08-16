# shows login page
get '/sessions/new' do
  erb :'/sessions/login'
end

# posts login info from the form and redirects appropriately
post '/sessions/new' do
  # note that login form will need to look like "name='user[password]'"
  @user = User.find_by(username: params[:user][:username])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Something went wrong."]
    erb :"/_errors"
  end
end

delete '/logout' do
  session[:user_id] = nil
  redirect '/'
end
