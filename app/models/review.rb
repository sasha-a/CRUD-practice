class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant

  validates :points, presence: true, numericality: { greater_than: 0 }
end
