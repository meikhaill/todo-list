require 'sinatra'
require 'pry'

$todos = []

get '/' do
  @todos = $todos
  @hello = "mac"
  erb :index
end

post '/add_todo' do 
  todo = params[:todo]
  if todo 
    $todos << todo 
  end
  redirect '/'
end