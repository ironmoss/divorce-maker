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

  def winner
    # gets the total points of each user
    #compares them & spits out the winner
    if user1.total_points > user2.total_points
      user1
    elsif user1.total_points < user2.total_points
      user2
    end
  end

end