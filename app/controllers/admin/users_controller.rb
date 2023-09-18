class Admin::UsersController < ApplicationController
  
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page]).per(5)
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      @recipes = @user.recipes
    else
      # ユーザーが存在しない場合の処理を追加するか、エラーメッセージを表示するなどの適切な対応を行う
      redirect_to root_path, alert: "ユーザーが存在しません。"
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user), notice: "ユーザー情報を更新しました。"

  end

   private



  def customer_params
    params.require(:user).permit(:name, :email, :introduction)
  end
end
