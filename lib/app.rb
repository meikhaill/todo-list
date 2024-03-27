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
  unless todo.strip.empty?
    $todos << todo 
  end
  redirect '/'
end