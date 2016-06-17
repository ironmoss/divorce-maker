# Homepage (Root path)

enable :sessions

helpers do
	def current_user
		#gets the current user from the session 
		@current_user ||= User.find_by nickname: session["username"] if session["nickname"]
	end

	def other_user(current_user)
		#gets the other user info
		if current_user.id == relationships.user1_id
			@other_user = relationships.user2_id
		else 
			@other_user = relationships.user1_id
		end
	end	

	def total_points(user)
		#calculates total points of any user that's passed		
		#sum total points of total_user all incidents 
		user.incidents.sum(:calculated_points)
	end

	def winner(current_user, other_user)
		#compares total_points of current_user and other_user
		if total_points(current_user) > total_points(other_user)
			current_user.nickname
		else 
			other_user.nickname
		end
	end 

end

get '/' do
  erb :index
end

get '/relationships' do
	erb :'relationships/index'
end

get '/relationships/:id' do
	@relationship = Relationship.find params[:id]
  erb :'relationships/show'
end





