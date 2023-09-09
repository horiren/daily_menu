class Public::RecipesController < ApplicationController
  
  def show
    @recipe = Recipe.find(params[:id])
    @post_comment = PostComment.new
  end
  
end
