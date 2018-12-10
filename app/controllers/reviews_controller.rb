class ReviewsController < ApplicationController
  before_action :require_login
 
 
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to create and delete reviews."
      @product = Product.find(params[:product_id])
      redirect_to product_path(@product)
    end
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    @review.user = current_user
    
    if @review.save
      redirect_to product_path(@product), notice: 'Review created!'
    else
      #render :new
    end

  end

 
  def destroy
    @review = Review.find params[:id]
    @product = Product.find(params[:product_id])
    @review.destroy
    redirect_to product_path(@product), notice: 'Review deleted!'
  end


  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
      :product_id
    )
  end
end
