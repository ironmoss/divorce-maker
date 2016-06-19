# Homepage (Root path)
require 'chartkick'

helpers do

	  def logged_in?
    if session["nickname"]
      current_user
      if @current_user
        true
      end
    else
      false
    end
  end

	def current_user
		#gets the current user from the session

    @current_user ||= User.find_by nickname: session["nickname"] if session["nickname"]

	end

	def current_partner
		@partner = current_relationship.partner(current_user.id)
	end

	def current_relationship
		@current_relationship ||= Relationship.find(session["relationship"]) if session["relationship"]
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

get '/logout' do
  session["nickname"] = nil
  session["relationship"] = nil
  redirect '/'
end

get '/login/:id/:nickname' do
	@relationship = Relationship.find params[:id]
	@incidents = Incident.where(relationship_id: params[:id]).order("created_at desc")
	@user = User.find_by nickname: params[:nickname]
    session["nickname"] = @user.nickname
    session["relationship"] = @relationship.id
  redirect "/relationships/#{params[:id]}/#{params[:nickname]}"
end


get '/relationships/forget' do
	erb :'relationships/forget'
end

get '/relationships/:id/:nickname' do
	@relationship = Relationship.find params[:id]
	@incidents = Incident.where(relationship_id: params[:id]).order("created_at desc")
	@user = User.find_by nickname: params[:nickname]

  erb :'relationships/show'
end

post '/relationships/forgive' do
	@incident = Incident.find params[:id]

	if @incident.update(
		status: 'forgiven',
		calculated_points: 0)
    redirect "/relationships/#{params[:id]}/#{params[:nickname]}"
  else
  	erb :'relationships/show'
  end
end

get '/relationships/:id/:nickname/kiss' do
  erb :'/relationships/kiss/index'
end

get '/relationships/:id/:nickname/yell' do
  erb :'/relationships/yell/index'
end

post '/relationships/:id/:nickname/kiss' do
	@incident = current_relationship.incidents.build(
		user_id: current_partner.id,
		relationship_id: current_relationship.id,
	  category: params[:category],
	  description: params[:description],
		status: "positive"
	  )
	if @incident.save
  	redirect "/relationships/#{params[:id]}/#{params[:nickname]}"
	else
		erb :index
	end
end

post '/relationships/:id/:nickname/yell' do
	@incident = current_relationship.incidents.build(
		user_id: current_partner.id,
		relationship_id: current_relationship.id,
	  category: params[:category],
	  description: params[:description],
		status: "negative"
	  )

	if @incident.save
  	redirect "/relationships/#{params[:id]}/#{params[:nickname]}"
	else
		erb :index
	end
end
