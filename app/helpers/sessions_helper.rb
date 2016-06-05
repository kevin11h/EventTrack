module SessionsHelper

  def user_logged
    redirect_to root_url unless logged_in?
  end

end
