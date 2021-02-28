class RestaurantsController < ApplicationController
 before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

   def index
    @restaurants = policy_scope(Restaurant)
   end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to root_path
  end

  def destroy
    @restaurant.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end




  private

  def restaurant_params
    # params.require(:dragon).permit(:nickname, :country, :size, :speed, :description, :search, :photo)
    params.require(:restaurant).permit(:name, :address)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

end
