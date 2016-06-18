# Homepage (Root path)
require 'chartkick'

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

	def my_incident?(current_incident_id)
		if Incident.where(incident_id: current_incident_id)
			true
		else
			false
		end
	end

end

get '/' do
  erb :index
end

get '/relationships' do
	erb :'relationships/index'
end

get '/relationships/forget' do 
	erb :'forget-page/forget-page'
end

get '/relationships/:id' do
	@relationship = Relationship.find params[:id]
	@incidents = Incident.where(relationship_id: params[:id]).order("created_at desc")
  erb :'relationships/show'
end

post '/relationships/forgive' do
	@incident = Incident.find params[:id]
	@forgive = @incident.update(status: 'forgiven')
    redirect "/relationships/#{current_relationship.id}"
end

get '/relationships/:id/new_kiss' do
  erb :'/relationships/new_kiss/index'
end

get '/relationships/:id/new_yell' do
  erb :'/relationships/new_yell/index'
end

post '/relationships/:id/new_kiss' do
	@incident = current_relationship.incidents.build(
		user_id: current_partner.id,
		relationship_id: current_relationship.id,
	  category: params[:category],
	  description: params[:description],
		status: "positive"
	  )
		if @incident.save
	  	redirect 'relationships/1'
		else
			erb :index
		end
end

post '/relationships/:id/new_yell' do
	@incident = current_relationship.incidents.build(
		user_id: current_partner.id,
		relationship_id: current_relationship.id,
	  category: params[:category],
	  description: params[:description],
		status: "negative"
	  )
		if @incident.save
	  	redirect 'relationships/1'
		else
			erb :index
		end
end