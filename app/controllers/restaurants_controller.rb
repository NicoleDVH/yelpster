class RestaurantsController < ApplicationController
  def index
  	@resturant = Restaurants.all
  end


end
