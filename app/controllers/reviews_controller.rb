class ReviewsController < ApplicationController

  def create
    @review = Review.new
    @review.product_id = params[:product_id].to_i
    @review.user_id = session[:user_id]
    @review.description = review_params[:description]
    @review.rating = review_params[:rating].to_i

    if @review.save
      redirect_to product_path(id: params[:product_id])
    else
      redirect_to :login
    end

  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
