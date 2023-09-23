class Public::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    if @user
      @recipes = @user.recipes.order(created_at: :desc).page(params[:page]).per(30)
    else
      # ユーザーが存在しない場合の処理を追加するか、エラーメッセージを表示するなどの適切な対応を行う
      redirect_to root_path, alert: "ユーザーが存在しません。"
    end
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
