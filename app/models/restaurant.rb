class Restaurant < ActiveRecord::Base

  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :location, :cuisine, :user_id, presence: true

end
