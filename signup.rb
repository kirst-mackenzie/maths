require 'sinatra'
enable :sessions

get('/') do
  erb :signup
end

get('/:name') do
  @name = params[:name].capitalize
  erb :signup
end

get('/:goodbye/:name') do
  @goodbye = params[:goodbye].capitalize
  @name = params[:name].capitalize
  erb :signup
end

get('/:goodbye/:name/:day') do
  @goodbye = params[:goodbye].capitalize
  @name = params[:name].capitalize
  @day = params[:day]
  erb :signup
end

post('/signup') do
  puts params[:name]
  puts params[:email]

session[:name]=params[:name]
redirect to("/")

end