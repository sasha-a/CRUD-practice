class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant

  validates :points, presence: true
end
