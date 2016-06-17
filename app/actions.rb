# Homepage (Root path)
get '/' do
  erb :index
end

get '/relationships/new_kiss' do
  erb :'/relationships/new_kiss/index'
end
