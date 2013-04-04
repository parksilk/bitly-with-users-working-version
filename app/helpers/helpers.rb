helpers do

  def login(user)
    session[:token] = user.id
  end

  # This will return the current user, if they exist
  # Replace with code that works with your application
  def current_user
    if session[:token]
      @current_user ||= User.find_by_id(session[:token])
    end
  end

  # Returns true if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
  end

end