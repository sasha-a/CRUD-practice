require 'faker'

User.delete_all
Restaurant.delete_all

usernames = Faker::StarWars.species
random_user_id = [1, 2, 3]
random_restaurant_id = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
random_rating = [1, 2, 3, 4, 5]

users = 3.times.map do
  User.create!( :username => usernames.sample,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

restaurants = 10.times.map do
  Restaurant.create!( :name => Faker::Hipster.word,
                      :location => Faker::Address.city,
                      :cuisine => Faker::Hipster.words(3).join(""),
                      :user_id => random_user_id.sample )
end

reviews = 10.times.map do
  Review.create!( :points => random_rating.sample,
                  :body => Faker::Hipster.paragraphs,
                  :user_id => random_user_id.sample,
                  :restaurant_id => random_restaurant_id.sample)
end
