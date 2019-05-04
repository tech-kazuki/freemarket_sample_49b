class ProductsController < ApplicationController
  # require 'payjp'
  
  def index
  end

  def show
  end
 
  def new
    parents = Category.roots
    @parents = parents.map{|parent| parent.name}

    unless params[:category].nil?
      category = params[:category]
      parents = Category.find_by(name: category)
      @children = parents.children
      respond_to do |format|
        format.json
      end
    end

    unless params[:category_a].nil?
      category = params[:category_a]
      parents = Category.find_by(id: category)
      @children = parents.children
      respond_to do |format|
        format.json
      end
     end
   
    @product = Product.new
    @user = User.find(current_user.id)
    @product.images.build
  end
  
  def create
    product = Product.new(product_params)
    product.user = current_user
    product.save
    redirect_to root_path
  end

  def buy
  end
  
  def pay
    Payjp.api_key = #ここに秘密鍵
    Payjp::Charge.create(
      amount:   3000,
      customer: current_user.id,
      currency: 'jpy'
    )
    redirect_to root_path
  end

  private
  
  def product_params
    params.require(:product).permit(:name, :price, :description, :category_id, :product_state, :burden, :size, :prefecture_id, :how_long, :how_ship, :brand, :availability, images_attributes: [:image])
  end
end
