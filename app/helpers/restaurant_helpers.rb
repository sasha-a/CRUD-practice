helpers do
  def my_restaurant?(restaurant)
    current_user.id == restaurant.user_id
  end

  def rating
  end
end
