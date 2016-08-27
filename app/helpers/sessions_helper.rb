module SessionsHelper
  def logged_in?
    session[:login]
  end
end
