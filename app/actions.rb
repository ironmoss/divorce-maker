# Homepage (Root path)
require 'chartkick'

helpers do
	def current_user
		#gets the current user from the session
    @current_user ||= User.find_by username: session["username"] if session["username"] 
	end

	def current_partner
		@partner = current_relationship.partner(current_user.id)
	end

	def current_relationship
		@current_relationship ||= Relationship.find relationship: session["relationship"]

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

get '/relationships/:id/:username' do
  @relationship = Relationship.find id: params[:id]
  @user = User.find_by username: params[:username]
    session["username"] = @user.username
    session["relationship"] = @relationship.id
    redirect '/relationships/#{current_relationship.id}'
  end
end

post '/logout' do
  session["username"] = nil
  session["relationship"] = nil
  redirect '/'
end

get '/relationships/forget' do 
	erb :'relationships/forget'
end

get '/relationships/:id/:username' do
	@relationship = Relationship.find params[:id]
	@incidents = Incident.where(relationship_id: params[:id]).order("created_at desc")
  erb :'relationships/show'
end

post '/relationships/forgive' do
	@incident = Incident.find params[:id]

	if @incident.update(
		status: 'forgiven',
		calculated_points: 0)
    redirect "/relationships/#{current_relationship.id}"
  else
  	erb :'relationships/show'
  end
end

get '/relationships/:id/:username/kiss' do
  erb :'/relationships/kiss/index'
end

get '/yell' do
  erb :'/relationships/yell/index'
end

post '/kiss' do
	@incident = current_relationship.incidents.build(
		user_id: current_partner.id,
		relationship_id: current_relationship.id,
	  category: params[:category],
	  description: params[:description],
		status: "positive"
	  )
		if @incident.save
	  	redirect "relationships/#{current_relationship.id}"
		else
			erb :index
		end
end

post '/relationships/:id/:username/yell' do
	@incident = current_relationship.incidents.build(
		user_id: current_partner.id,
		relationship_id: current_relationship.id,
	  category: params[:category],
	  description: params[:description],
		status: "negative"
	  )
		if @incident.save
	  	redirect "relationships/#{current_relationship.id}"
		else
			erb :index
		end
end