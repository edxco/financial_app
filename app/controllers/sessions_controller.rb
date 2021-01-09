class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(username: params[:session][:username].downcase)
        if user
          session[:user_id] = user.id
          flash[:notice] = "Welcome #{user.username}, to Edx Wallet"
          redirect_to user_path(current_user)
        else
          flash.now[:alert] = "Error on login"
          render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = 'Logged out'
        redirect_to root_path
    end

end