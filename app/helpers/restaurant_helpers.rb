helpers do
  def my_restaurant?(restaurant)
    current_user.id == restaurant.user_id
  end

  def has_reviews?(restaurant)
    restaurant.reviews.length > 0
  end

end
