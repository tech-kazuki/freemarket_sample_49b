class CardsController < ApplicationController
  require 'payjp'
  
  def new
  end
  
  def create
    @card = Card.new
    @card.payjptoken = params[:payjpToken]
    @card.user_id = params[:user_id]
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    Payjp::Customer.create(
      card: @card.payjptoken,
      id: @card.user_id
    )
    @card.save
    redirect_to complete_path
  end
end

