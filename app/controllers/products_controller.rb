class ProductsController < ApplicationController
  def index
  end

  def show
  end
 
  def new
    @product = Product.new
    @user = User.find(current_user.id)
    @product.images.build
  end
  
  def create
    product = Product.new(product_params)
    product.user = current_user
    product.save
  end

  def buy
  end

  private
  
  def product_params
    params.require(:product).permit(:name, :price, :description, :category_id, :product_state, :burden, :size, :prefecture_id, :how_long, :how_ship, :brand_id, :availability, images_attributes: [:image])
  end
end
