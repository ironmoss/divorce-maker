# Homepage (Root path)

helpers do
	def current_user
		#gets the current user from the session 
		@current_user ||= User.find(1)
		#nickname: session["username"] if session["nickname"]
	end

	def current_partner
		@partner = current_relationship.partner(current_user.id)
	end

	def current_relationship
		@current_relationship ||= Relationship.find(1)

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
	@incidents = Incident.where relationship_id: params[:id]
  erb :'relationships/show'
end

