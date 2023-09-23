class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @recipes = Recipe.looks(params[:search], params[:word]).order(created_at: :desc).page(params[:page]).per(30)
    end
  end
end
