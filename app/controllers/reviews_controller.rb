class ReviewsController < ApplicationController

  def create
    puts "BBBBBBBBBBBBBBBB", review_params
    puts "ZZZZZZZZZZZZZZZZZZZZz", params
    puts "Descriptionaaaaaaaaaa", params[:product_id]
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    
    if @review.save
      redirect_to product_path(@product), notice: 'Review created!'
    else
      #render :new
    end

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
