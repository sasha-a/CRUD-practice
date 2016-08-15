helpers do

  def current_user
  	# if session[:user_id]
	    @current_user = @current_user || User.find_by(id: session[:user_id])
	  # end
  end

# does this need to be self?
  def logged_in?
    self.current_user != nil
  end

  def ensure_login!
    redirect '/sessions/new' unless logged_in?
  end

end
