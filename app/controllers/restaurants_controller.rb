class RestaurantsController < ApplicationController
def index
    @restaurants = Restaurant.where('name LIKE :query', query: "%#{params[:q]}%")
    #@restaurants_d = Restaurant.where('district LIKE :query', query: "%#{params[:q]}%")
end

def show
    @restaurant = Restaurant.find(params[:id])
end

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

private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :district, :phone, :coupon_type)
  end
end

