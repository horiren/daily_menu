class Public::RecipesController < ApplicationController
  
  before_action :correct_user, only: [:edit, :updat, :destroy]
  
  def index
    @recipes = Recipe.all
  end 
  
  def new
    @recipe = Recipe.new
  end 
  
  def show
    @recipe = Recipe.find(params[:id])
    if @recipe
      @post_comment = PostComment.new
      @comments = @recipe.post_comments.order(created_at: :desc)
      @user = @recipe.user
    else
      flash[:error] = "Recipe not found"
      redirect_to recipes_path # または他の適切なリダイレクト先
    end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end 
  
  def create
    recipe = Recipe.new(recipe_params)
    recipe.user_id = current_user.id
    # 3. データをデータベースに保存するためのsaveメソッド実行
    recipe.save
    # 4. トップ画面へリダイレクト
    redirect_to recipes_path
  end 
  
  def destroy
    recipe = Recipe.find(params[:id])  # データ（レコード）を1件取得
    user = recipe.user_id
    recipe.destroy  # データ（レコード）を削除
    redirect_to user_path(user)
  end 
  
  def update
    recipe = Recipe.find(params[:id])
    recipe.update(recipe_params)
    redirect_to recipe_path(recipe.id)
  end 
  
  def likes
    likes = current_user.favorites.pluck(:recipe_id)
    @like_recipes = Recipe.find(likes)
  end
  
  private
  # ストロングパラメータ
  def recipe_params
    params.require(:recipe).permit(:name, :explanation, :comment, :image)
  end
  
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
  
  def correct_user
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
    redirect_to(recipes_path) unless @user == current_user
  end
  
end
