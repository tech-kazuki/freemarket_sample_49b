class LikesController < ApplicationController

  def index
    @products = []
    @likes = Like.where(user_id: current_user.id).order('created_at DESC')
    @likes.each do |like|
      @products << Product.find(like.product_id)
    end
  end

  def create
    @like = Like.create(user_id: current_user.id, product_id: params[:product_id])
    @likes = Like.where(product_id: params[:product_id])
    get_product
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, product_id: params[:product_id])
    @like.destroy
    @likes = Like.where(product_id: params[:product_id])
    get_product
  end

  def get_product
    @product = Product.find(params[:product_id])
  end
end
