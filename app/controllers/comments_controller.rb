class CommentsController < ApplicationController


  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment.restaurant = @restaurant
    if comment.save
      redirect_to restaurant_path(@restaurant)
    else
      render: new
    end

    end


  end

   private

  def comment_params
    # params.require(:dragon).permit(:nickname, :country, :size, :speed, :description, :search, :photo)
    params.require(:comment).permit(:content)
  end

end
