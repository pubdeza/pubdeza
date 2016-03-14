class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :post_params, only: [:create, :update]
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    if user_signed_in?
     @post = Post.new
     # postモデルの空のオブジェクト
   else
     redirect_to new_user_session_path
     # ユーザーがログインしていない場合ログイン画面にリダイレクト
   end
  end

  def create
   @post = Post.new(post_params)
   # バリデーションが通った場合
   if @post.save
     redirect_to @post, notice: "投稿が保存されました"
   else
     render :new
   end
 end

 def edit
 end

 def update
 end

 def destroy
 end

 private

 def set_post
   @post = Post.find(params[:id])
 end

 def post_params
     params.require(:post).permit(:title, :icatch, :contents, :user_id)
 end
end
