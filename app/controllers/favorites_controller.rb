class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :destroy]

  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user_id = current_user.id
    @favorite.save
    if @favorite.save
      redirect_to(:back, notice: "お気に入りを追加しました")
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by!(favorite_params)
    @favorite.destroy
    redirect_to(:back)
  end

  private

  def favorite_params
    params.permit(:post_id)
  end
end
