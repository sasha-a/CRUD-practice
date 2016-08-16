get '/restaurants/:id/reviews/new' do
  ensure_login!
  @restaurant = Restaurant.find_by(id: params[:id])
  erb :"/reviews/new"
end

post '/restaurants/:id/reviews' do
  ensure_login!
  @restaurant = Restaurant.find_by(id: params[:id])
  @review = Review.new(params['review'])
  @review.user_id = current_user.id
  @restaurant.reviews << @review

  if @review.save
    @message = "Thank you for your review!"
    redirect "/restaurants/#{@restaurant.id}"
  else
    "hello"
  end
end
