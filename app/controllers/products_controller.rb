class ProductsController < ApplicationController
  require 'payjp'
  require 'json'
  
  def index
    @category1 = Category.find_by(name: "レディース")
    categoryLadys = @category1.indirects
    @ladys = Product.where(category_id: categoryLadys).order('created_at DESC').limit(4)


    @category2 = Category.find_by(name: "メンズ")
    categoryMens = @category2.indirects
    @mens = Product.where(category_id: categoryMens).order('created_at DESC').limit(4)

  end

  def show
    @product, @image = get_product
    @like = @product.likes
  end
 
  def new
    parents = Category.roots
    @parents = parents.map{|parent| parent.name}
    get_category_children unless params[:category].nil?
    get_category_grandchildren unless params[:category_a].nil?
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

  def edit

    @product = Product.find(params[:id])
    parents = Category.roots
    @parents = parents.map{|parent| parent.name}
    @image = Image.find(params[:id])
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
    @user = User.find(current_user.id)
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
    redirect_to("/users/#{@product.user.id}/products/#{@product.id}")
  end

  def buy
    @product, @image = get_product
    @address = current_user.address
    Payjp.api_key = ENV["PAYJP_API_KEY"]
    customer = Payjp::Customer.retrieve(current_user.id.to_s)
    @card = customer.cards.retrieve(customer.default_card)
  end
  
  def pay
    Payjp.api_key = ENV["PAYJP_API_KEY"]
    Payjp::Charge.create(
      amount:   params[:price],
      customer: current_user.id,
      currency: 'jpy'
    )
    redirect_to pay_after_user_product_path(current_user, params[:id])
  end
  
  private
  
  def product_params
    params.require(:product).permit(:name, :price, :description, :category_id, :product_state, :burden, :size, :prefecture_id, :how_long, :how_ship, :brand, :availability, images_attributes: [:image])
  end

  def get_product
    product = Product.find(params[:id])
    image = Image.find_by(product_id: params[:id])
    return product, image
  end

  def get_category_children
    category = params[:category]
    parents = Category.find_by(name: category)
    @children = parents.children
    respond_to do |format|
      format.json
    end
  end

  def get_category_grandchildren
    category = params[:category_a]
    parents = Category.find_by(id: category)
    @children = parents.children
    respond_to do |format|
      format.json
    end
  end
end
