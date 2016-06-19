class Relationship < ActiveRecord::Base
  
  has_many :incidents

  belongs_to :user1, class_name: 'User', foreign_key: 'user1_id'
  belongs_to :user2, class_name: 'User', foreign_key: 'user2_id'

	def partner(current_user_id)
		#gets the other user info
		if current_user_id == user1.id
			partner = User.find(user2.id)
		else 
			partner = User.find(user1.id)
		end
	end	

# Checks both users points and returns the user with the highest point value.
# Returns nil in case of a tie. 
  def winner
    if user1.total_points > user2.total_points
      user1
    elsif user1.total_points < user2.total_points
      user2
    end
  end

end