enable 'sessions'

get '/login' do
  erb :'login/index'
end

post '/login' do
  email = params[:email]
  password = params[:password]
  user = User.authenticate(email, password)

  if user.nil?
    redirect '/login'
  else
    session[:user_id] = user.id
    redirect '/entries'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
