class UsersController < ApplicationController

    def index
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          flash[:notice] = "Your account information was succesfully updated"
          redirect_to user_path
        else
          render 'edit'
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to Edx Wallet"
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end