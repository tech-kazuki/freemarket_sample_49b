require 'rails_helper'

# describe ProductsController do
#   let(:product) {Product.new(params)}
#   let(:params) { create(:product, user_id: user.id) } 
#   let(:user) { create(:user) }
#   describe '#create' do
#     context 'ログインしている' do
#       before do
#         login user
#       end
      
#       context '出品できる' do
#         subject {
#           post :create,
#           params: params
#         }
        
#         it '商品のカウントが増える' do
#           expect { subject }.to change(Product, :count).by(1)
#         end
#       end
#     end
    
#     context 'ログインしていない' do
#       describe '商品の出品ができない' do
#       end
      
#       describe '商品の購入ができない' do
#       end
#     end
#   end
# end
