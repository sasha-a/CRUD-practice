class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant

  validates :points, :body, :user_id, :restaurant_id, presence: true
end
