class ProductsController < ApplicationController
  def index
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
  end

  def buy
  end
end
