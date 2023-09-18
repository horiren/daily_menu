class Public::PostCommentsController < ApplicationController
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.post_comments.build(post_comment_params)
    @comment.user_id = current_user.id
    @comment.save
  end
  
  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = PostComment.find(params[:id])
    @comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :recipe_id, :user_id)
  end

  
end
