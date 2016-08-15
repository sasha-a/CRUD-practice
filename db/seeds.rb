require 'faker'

User.delete_all
Restaurant.delete_all

p Faker::StarWars.species

users = 3.times.map do
  User.create!( :username => Faker::StarWars.specie,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

restaurant_user_id = [1, 2, 3]
restaurants = 10.times.map do
  Restaurant.create!( :name => Faker::Hipster.word,
                :location => Faker::Address.city,
                :cuisine => 'awesome',
                :user_id => restaurant_user_id.sample )
end
