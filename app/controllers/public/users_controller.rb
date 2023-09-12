class Public::UsersController < ApplicationController
  
  def show
    @user = User.find_by(id: params[:id])
    @recipes = @user.recipes
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      # 更新が成功した場合の処理
      redirect_to user_path(@user), notice: "ユーザー情報が更新されました。"
    else
      # 更新が失敗した場合の処理
      render 'edit'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
