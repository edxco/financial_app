class GroupsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_group, only: %i[show edit update destroy]
  
    def index
      @groups = Group.order(name: :asc).all
    end
  
    def show
      @group_transactions = Transaction.grouped_display(params[:id])
  
      @group_transactions = @group_transactions.order(created_at: :desc)
  
      @group_transaction_sum = @group_transactions.sum(:amount)
    end
  
    def new
      @group = Group.new
    end
  
    def edit; end
  
    def create
      @group = Group.new(group_params)
      @group.user_id = current_user.id
  
      respond_to do |format|
        if @group.save
          format.html { redirect_to '/groups', notice: 'Group was successfully created.' }
        else
          format.html { render :new }
  
        end
      end
    end
  
    def update
      respond_to do |format|
        if @group.update(group_params)
          format.html { redirect_to '/groups', notice: 'Group was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end
  
    def destroy
      @group.destroy
      respond_to do |format|
        format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      end
    end
  
    private
  
    def set_group
      @group = Group.find(params[:id])
    end
  
    def group_params
      params.require(:group).permit(:name, :icon, :user_id)
    end
  end