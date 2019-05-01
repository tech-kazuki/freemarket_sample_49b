class ProductsController < ApplicationController
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
     children = parents.children
     @children = []
     children.each do |child|
       @child = child
       @children << @child
     end
     respond_to do |format|
      format.json
     end
    end

    unless params[:category_a].nil?
      category = params[:category_a]
      parents = Category.find_by(id: category)
      children = parents.children
      @children = []
      children.each do |child|
        @child = child
        @children << @child
      end
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
  end

  def buy
  end

  private
  
  def product_params
    params.require(:product).permit(:name, :price, :description, :category_id, :product_state, :burden, :size, :prefecture_id, :how_long, :how_ship, :brand_id, :availability, images_attributes: [:image])
  end
end
