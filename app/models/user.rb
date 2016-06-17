class User < ActiveRecord::Base

  has_many :relationships
  has_many :incidents

  def total_points
		#calculates total points of any user that's passed		
		#sum total points of total_user all incidents 
		Incident.all.where(user_id = id).sum(:calculated_points)
	end

	def partner
		#gets the other user info
		if id == relationship.user1
			partner = User.find(2)
		else 
			partner = User.find(1)
		end
	end	


end