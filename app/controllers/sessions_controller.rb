class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(id: params[:session][:id])
    if !user.nil?
      log_in user
      flash[:success] = "Login Successful"
      redirect_to root_path
    else
      flash.new[:danger] = "Login failed"
      render :new
    end
  end

end
