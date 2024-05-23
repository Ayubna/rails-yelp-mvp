class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new_review
    @restaurant = Restaurant.new # Needed to instantiate the form_with
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end


  def create

    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :see_other
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
