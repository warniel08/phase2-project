# route handlers dealing with the collection
get '/posts' do
  @weather = Weather.all
  @posts = Post.most_recent
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :'posts/index'
  else
    erb :'posts/index'
  end
end

get '/posts/new' do
  if session[:user_id]
    erb :'posts/new'
  else
    erb :'404'
  end
end

post '/posts' do
  return erb :'404' unless session[:user_id]
  @post = Post.new(params[:post])
  @post.user_id = session[:user_id]

  if @post.save
    redirect "/posts/#{@post.id}"
  else
    @errors = @post.errors.full_messages
    erb :'posts/new'
  end
end

get '/posts/:id' do
  @post = find_and_ensure_post(params[:id])
  erb :'posts/show'
end

put '/posts/:id' do
  return erb :'404' unless session[:user_id]
  @post = find_and_ensure_post(params[:id])
  @post.assign_attributes(params[:post])

  if @post.save
    redirect "posts/#{@post.id}"
  else
    @errors = @post.errors.full_messages
    erb :'posts/edit'
  end
end

delete '/posts/:id' do
  return erb :'404' unless session[:user_id]
  @post = find_and_ensure_post(params[:id])
  @post.destroy
  redirect '/posts'
end

get '/posts/:id/edit' do
  return erb :'404' unless session[:user_id]
  @post = find_and_ensure_post(params[:id])
  return erb :'404' unless session[:user_id] == @post.user.id
  erb :'posts/edit'
end
