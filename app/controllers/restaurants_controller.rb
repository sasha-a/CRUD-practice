# Home page
get '/' do
  @restaurants = Restaurant.all.sort.reverse
  erb :'/restaurants/index'
end

# form for restaurant
get '/restaurants/new' do
  ensure_login!
  erb :"/restaurants/new"
end

# Create new restaurant
post '/restaurants' do
  ensure_login!
  @restaurant = Restaurant.new(params['restaurant'])
  current_user.restaurants << @restaurant

  if @restaurant.save
    redirect "/restaurants/#{@restaurant.id}"
  else
    @errors = @restaurant.errors.full_messages
    erb :"/restaurants/new"
  end
end

# Single restaurant view
get '/restaurants/:id' do
  @restaurant = Restaurant.find_by(id: params[:id])
  erb :"/restaurants/show"
end

get '/restaurants/:id/edit' do
  ensure_login!
  @restaurant = Restaurant.find_by(id: params[:id])
  erb :"/restaurants/edit"
end

put '/restaurants/:id' do
  ensure_login!
  @restaurant = Restaurant.find_by(id: params[:id])

  if my_restaurant?(@restaurant)
    if @restaurant.update_attributes(params['restaurant'])
      redirect :"/restaurants/#{@restaurant.id}"
    else
      @errors = ["Something went wrong."]
      erb :"/restaurants/edit"
    end
  else
    redirect '/'
  end
end

delete '/restaurants/:id' do
  ensure_login!
  @restaurant = Restaurant.find_by(id: params[:id])
  if my_restaurant?(@restaurant)
    @restaurant.destroy
  end
  redirect '/'
end





