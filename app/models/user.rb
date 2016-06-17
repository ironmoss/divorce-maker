class User < ActiveRecord::Base

  has_many :relationships
  has_many :incidents

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def total_points
		#calculates total points of any user that's passed		
		#sum total points of total_user all incidents 
		Incident.where(user_id: id).sum(:calculated_points)
	end



end