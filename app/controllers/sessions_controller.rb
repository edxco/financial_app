class SessionsController < ApplicationController
  before_action :check_signed_in, except: %i[destroy]

  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user.is_a?(User)
      session[:user_id] = user.id
      flash[:notice] = 'Logged in successfully'
      redirect_to users_path(@user)
    else
      flash.now[:alert] = 'There was something wrong with your login details'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to root_path
  end
end
