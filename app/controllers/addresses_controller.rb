class AddressesController < ApplicationController
  def new
    @user = User.find(current_user.id)
    @address = Address.new
  end

  def create
    redirect_to new_user_card_url(current_user.id)
  end

  private

  def address_params
    params.permit()
  end
end
