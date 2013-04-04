get '/' do
  @urls = Url.order("created_at")
  # @url = Url.find_by_key(params[:key])
  erb :index
end

post '/urls' do
  if logged_in?
    current_user
    @url = Url.create(:url => params[:url],
                      :click_count => 0,
                      :user_id => @current_user.id)
  else
    @url = Url.create(:url => params[:url],
                      :click_count => 0)
  end

  @urls = Url.order("created_at")
  erb :index
end

get '/shorty/:short_url' do
  @url = Url.find_by_key(params[:short_url])
  @url.update_attributes(:click_count => (@url.click_count + 1))
  # redirect to appropriate "long" URL
  redirect to @url.url
end

