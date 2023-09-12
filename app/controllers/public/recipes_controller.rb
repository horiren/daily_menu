class Public::RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
  end 
  
  def new
    @recipe = Recipe.new
  end 
  
  def show
    @recipe = Recipe.find(params[:id])
    @post_comment = PostComment.new
    @user = @recipe.user
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
    recipe.destroy  # データ（レコード）を削除
    redirect_to recipe_path(recipe.id)  # 投稿一覧画面へリダイレクト  
  end 
  
  def update
    recipe = Recipe.find(params[:id])
    recipe.update(recipe_params)
    redirect_to recipe_path(recipe.id)
  end 
  
  private
  # ストロングパラメータ
  def recipe_params
    params.require(:recipe).permit(:name, :explanation, :comment, :image)
  end
  
end
