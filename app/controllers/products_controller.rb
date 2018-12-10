class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where(product: @product).order('created_at DESC')
    @reviews = @reviews.map {|item| {review: item, blank_stars: blank_stars(item)}}
  end

  def blank_stars(review)
    5 - review.rating.to_i
    
  end



end
