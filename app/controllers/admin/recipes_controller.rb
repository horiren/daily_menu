class Admin::RecipesController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @recipes = Recipe.all
  end 
  
  def show
    @recipe = Recipe.find(params[:id])
    if @recipe
      @post_comment = PostComment.new
      @user = @recipe.user
    else
      flash[:error] = "Recipe not found"
      redirect_to admin_recipes_path # または他の適切なリダイレクト先
    end
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
    user = recipe.user_id
    recipe.destroy  # データ（レコード）を削除
    redirect_to admin_user_path(user)  # 投稿一覧画面へリダイレクト  
  end 
  
  private
  # ストロングパラメータ
  def recipe_params
    params.require(:recipe).permit(:name, :explanation, :comment, :image)
  end
  
end
