class SearchesController < ApplicationController
  def index
    prm = search_params(params)
    @search = Product.ransack(prm)
    @categories = Category.all
    if params[:q] == nil || @search.result.empty?
      @products = Product.where('name LIKE(?) OR description LIKE(?) OR brand LIKE(?)', "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%").limit(20)
      @keyword = params[:keyword]
    else
      @products = @search.result
      @keyword = '商品検索' + get_pan(prm)
    end
  end
  
  private 
  
  def get_pan(params)
    keyword = ''
    params.each do |key, value|
      case key
      when 'price_gteq'
        keyword = keyword + ',' + "¥#{value}" + '~' unless value.blank?
      when 'price_lteq'
        keyword = keyword + "¥#{value}" unless value.blank?
      when 'product_state_eq_any'
        new_word = value.join(',')
        keyword = keyword + ',' + "#{new_word}" unless value.blank?
      else
        keyword = keyword + ',' + "#{value}" unless value.blank?
      end
    end
    return keyword
  end
  
  def search_params(params)
    if params[:keyword]
      params.permit(:keyword)
    else
      params.require(:q).permit(:name_or_description_or_brand_cont, :category_id_eq, :brand_cont, :size_eq, :price_gteq, :price_lteq, product_state_eq_any: [])
    end
  end
end
