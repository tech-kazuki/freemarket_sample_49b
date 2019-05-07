class LikesController < ApplicationController

  def create
    @like = Like.create(like_params)
    @likes = Like.where(get_product_id)
    @product = Product.find(params[:product_id])
  end

  def destroy
    @like = Like.find_by(like_params)
    @like.destroy
    @likes = Like.where(get_product_id)
    @product = Product.find(params[:product_id])
  end

  private
  def like_params
    params.permit(:product_id).merge(user_id: current_user.id)
  end

  def get_product_id
   params.permit(:product_id)
  end

end
