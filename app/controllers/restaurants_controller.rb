class RestaurantsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]

# Show and search all restaurants #

def index
  @restaurants = Restaurant.search_restaurant(params[:n],params[:d],params[:t])
end

# Show one restaurant #

def show
  @restaurant = Restaurant.find(params[:id])
end

# Create new restaurants as a creator #

def new
  @restaurant = Restaurant.new
end

def create
  @restaurant = Restaurant.new(restaurant_params)
  if @restaurant.save
    flash[:notice] = "Restaurant successfully saved"
    redirect_to @restaurant
  else
    flash[:error] = "There was a problem with your input"
    render :new
    # redirect_to new_restaurant_path
  end
end

# Edit / Cancel restaurant as a creator #

def edit
  @restaurant = Restaurant.find(params[:id])
end

def update
  @restaurant = Restaurant.find(params[:id])
  if @restaurant.update_attributes(restaurant_params)
    flash[:notice] = "Restaurant successfully updated"
    redirect_to @restaurant
  else
    flash[:error] = "There was a problem with your input"
    render :edit
  end
 end

# Destroy restaurant as a creator #
def destroy
  @restaurant = Restaurant.find(params[:id])
  @restaurant.destroy
  flash[:notice] = "Restaurant successfully deleted"
  redirect_to :action => :index, status: 303
end


private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :district_id, :phone, :coupon_type, :user_id)
  end
end