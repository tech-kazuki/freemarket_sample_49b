class UsersController < ApplicationController
  before_action :set_user

  def credit
  end

  def show
    @user = User.find(params[:id])
    @products_count = Product.count(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(set_user.id)
    @user.update(user_params)
      if @user.update(user_params)
        redirect_to edit_user_path
      else
        flash.now[:alert] = "入力してください"
        render :edit
      end

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
