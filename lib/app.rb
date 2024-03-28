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

post '/delete_todo' do
 index = params[:index].to_i
 if index >= 0 && index < $todos.length
    $todos.delete_at(index)
 end
 redirect '/' # Redirect back to the home page to see the updated list
end