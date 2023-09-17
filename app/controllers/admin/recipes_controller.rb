class Admin::RecipesController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @recipes = Recipe.all
  end 
  
  def show
    @recipe = Recipe.find_by(params[:id])
    @post_comment = PostComment.new
    @user = @recipe.user
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end 
  
  def update
    recipe = Recipe.find(params[:id])
    recipe.update(recipe_params)
    redirect_to admin_recipe_path(recipe.id)
  end 
  
  def destroy
    recipe = Recipe.find(params[:id])  # データ（レコード）を1件取得
    recipe.destroy  # データ（レコード）を削除
    redirect_to admin_user_path(recipe.id)  # 投稿一覧画面へリダイレクト  
  end 
  
  private
  # ストロングパラメータ
  def recipe_params
    params.require(:recipe).permit(:name, :explanation, :comment, :image)
  end
  
end
