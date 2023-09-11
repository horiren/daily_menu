class Public::UsersController < ApplicationController
  
  def show
    @user = User.find_by(id: params[:id])
    @recipes = @user.recipes
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
  end
  
end
