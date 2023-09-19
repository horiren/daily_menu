class Admin::PostCommentsController < ApplicationController
  
  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = PostComment.find(params[:id])
    @comment.destroy
    redirect_to admin_recipe_path(@recipe.id)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :recipe_id, :user_id)
  end

end
