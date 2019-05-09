class UsersController < ApplicationController
  before_action :set_user

  def credit
  end

  def show
    @user = User.find(params[:id])
    @products = Product.count(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit(:profile, :nickname))
    redirect_to edit_user_path
  end
    
  def logout
  end

  private
  def set_user
    @user = current_user
  end

end
