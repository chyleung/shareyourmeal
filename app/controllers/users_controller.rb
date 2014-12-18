class UsersController < ApplicationController
def index
    @users = User.all
end

def show
    @user = User.find(params[:id])
end

def new
  @user = User.new
end

def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User successfully saved"
      redirect_to @user
    else
      flash[:error] = "There was a problem with your input"
      render :new
      # redirect_to new_user_path
    end
  end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  if @user.update_attributes(user_params)
    flash[:notice] = "User successfully updated"
    redirect_to @user
  else
    flash[:error] = "There was a problem with your input"
    render :edit
  end
 end

private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, district_ids: [])
  end
end
