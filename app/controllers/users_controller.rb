class UsersController < ApplicationController
  before_action :set_user

  def credit
  end

  def show
  end

  def edit
  end
    
  def logout
  end

  private
  def set_user
    @user = current_user
  end

end
