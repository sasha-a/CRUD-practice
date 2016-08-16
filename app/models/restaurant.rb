class Restaurant < ActiveRecord::Base

  belongs_to :user
  has_many :reviews

  validates :name, presence: true, uniqueness: true
  validates :location, :cuisine, :user_id, presence: true

  scope :sorted, -> { order(name: :asc) }

  def has_reviews?
    self.reviews.length > 0
  end

  def reviewed_by?(user)
    self.reviews.find_by(user_id: user.id)
  end

  def average_rating
    total = 0
    self.reviews.each do |review|
      total += review.points
    end
    return total / self.reviews.length
  end
end
