module SessionsHelper

  # Logs in the user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current user that is logged in (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # True if user is logged in
  def logged_in?
    !current_user.nil?
  end


end
