class Relationship < ActiveRecord::Base

  has_many :incidents
  belongs_to :user1, class_name: 'User', foreign_key: 'user1_id'
  belongs_to :user2, class_name: 'User', foreign_key: 'user2_id'

	def partner
		#gets the other user info
		if session[:member].id == relationship.user1.id
			partner = User.find(2)
		else 
			partner = User.find(1)
		end
	end	

end