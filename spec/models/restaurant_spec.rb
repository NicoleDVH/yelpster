require 'rails_helper'

	RSpec.describe RestaurantsController, type: :controller do
		describe "POST #create" do
    		context "with valid attributes" do
      			it "create new restaurant" do
			        post :create, restaurant: attributes_for(:restaurant)
			        expect(restaurant.count).to eq(1)
			    end
		end
	end

end
