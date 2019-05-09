module ApplicationHelper
  def get_price(product)
    if product.price
      return price = '¥' + "#{product.price.to_s(:delimited)}"
    else
      return '商品が読み取れていません'
    end
  end
end
