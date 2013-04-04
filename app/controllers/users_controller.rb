post '/signup' do
  @user = User.new(:first_name => params[:first_name],
                      :last_name => params[:last_name],
                      :email => params[:email],
                      :password => params[:password])
  @user.password
  if @user.save
    login(@user)
    erb :index
  else
    redirect '/'
  end
end

post '/login' do
  @user = User.find_by_email(params[:email])
  if @user.password == params[:password]
    login(@user)
    erb :index
  else
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end


get '/users/:id' do
  if params[:id].to_i == current_user.id
    @user_urls = current_user.urls
    erb :profile
  else
    redirect '/'
  end
end

get '/signup' do
  erb :signup
end

get '/login' do
  erb :login
end