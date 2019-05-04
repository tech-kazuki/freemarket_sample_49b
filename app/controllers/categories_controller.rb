class CategoriesController < ApplicationController

  def index
  end

  def show
    @category= Category.find(params[:id])
    categoryIds = Category.find(params[:id]).indirect_ids
    if categoryIds.empty?
      categoryIds = Category.find(params[:id]).children
      if categoryIds.empty?
        categoryIds = Category.find(params[:id])
      end
    end
    @products = Product.where(category_id: categoryIds)
  end

end
