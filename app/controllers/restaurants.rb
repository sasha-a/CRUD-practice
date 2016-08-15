# Home page
get '/' do
  @restaurants = Restaurant.all.sort.reverse
  erb :'/restaurants/index'
end

# form for restaurant
get '/restaurants/new' do
  erb :"/restaurants/new"
end

# Create new restaurant
post '/restaurants' do
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
  @restaurant = Restaurant.find_by(id: params[:id])
  erb :"/restaurants/edit"
end

put '/restaurants/:id' do
  @restaurant = Restaurant.find_by(id: params[:id])

  if my_restaurant?(@restaurant)
    @restaurant.update(params['restaurant'])
    redirect :"/restaurants/#{@restaurant.id}"
  else
    @errors = ["Something went wrong."]
    erb :"/restaurants/edit"
  end
end






