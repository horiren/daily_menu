class Public::RecipesController < ApplicationController
  
  def index
  end 
  
  def new
  end 
  
  def show
    @recipe = Recipe.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def edit
  end 
  
  def create
  end 
  
  def destroy
  end 
  
  def update
  end 
  
end
