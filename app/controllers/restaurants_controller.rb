class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def index
  	@restaurant = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end


  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number)
  end

end
