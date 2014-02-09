class UsersController < ApplicationController
  def index
  	@users = User.all
  	@user = User.new
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render "new"
    end
  end 
private
  def user_params
    params.require(:user).permit(:name, :email)
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        # Handle a successful update.
      else
        render 'edit'
      end
  end
end