class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :check_login, except: [:index, :new, :create]
    before_action :require_user, only: [:edit, :update]

    def index
        @current_user = current_user
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.avatar.attach(params[:user][:avatar])
        if @user.update(user_params)
          flash[:notice] = "Your account information was succesfully updated"
          redirect_to user_path
        else
          render 'edit'
        end
    end

    def create
        @user = User.new(user_params)
        @user.avatar.attach(user_params[:avatar])
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to Edx Wallet"
            redirect_to users_path
        else
            render 'new'
        end
    end

    private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

    def user_params
        params.require(:user).permit(:username, :avatar)
    end

    def check_login
        redirect_to root_path if session[:user_name].nil?
    end
end