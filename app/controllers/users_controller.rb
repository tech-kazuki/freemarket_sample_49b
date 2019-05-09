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
    @user.update(user_params)
    redirect_to edit_user_path
  end
    
  def logout
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:nickname, :profile)
  end

end
