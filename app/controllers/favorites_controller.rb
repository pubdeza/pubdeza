class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :destroy]

  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    # hidden_fieldの値を取得
    @post = Post.find(params[:post_id])
    if @post.favorites.where(user_id: current_user.id).count == 0
      @favorite = Favorite.new(favorite_params)
      @favorite.user_id = current_user.id
      @favorite.save
      redirect_to(:back, notice: "お気に入りを追加しました")
    else
      redirect_to(:back, notice: "すでにお気に入りされています")
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    if @post.favorites.where(user_id: current_user.id).count == 1
      @favorite = current_user.favorites.find_by!(favorite_params)
      @favorite.destroy
      redirect_to(:back, notice: "お気に入りを解除しました")
    else
      redirect_to(:back, notice: "すでに削除されています")
    end
  end

  private

  def favorite_params
    params.permit(:post_id)
  end
end
