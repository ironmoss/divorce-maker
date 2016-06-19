class User < ActiveRecord::Base

  has_many :relationships
  has_many :incidents

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true

# Returns the total points of all incidents belonging to a user.
  def total_points
		Incident.where(user_id: id).sum(:calculated_points)
	end

end