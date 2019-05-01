class CardsController < ApplicationController
  def new
    @user = User.find(current_user.id)
    @card = Card.new
  end

  def create
  end
end
