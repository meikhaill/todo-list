require 'sinatra'
require 'pry'

enable :sessions

$todos = []

get '/login' do
 erb :login
end

post '/login' do
 username = params[:username]
 password = params[:password]

 # Example: Check against a hardcoded user
 if username == "admin" && password == "password"
    session[:user_id] = 1 # Simulate a logged-in user
    redirect '/'
 else
    @error = "Invalid username or password."
    erb :login
 end
end



get '/logout' do
 session.clear
 redirect '/login'
end

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

post '/clear_todo' do
 $todos = []
 redirect '/'

end

# before do
#  unless session[:user_id]
#     redirect '/login'
#  end
# end