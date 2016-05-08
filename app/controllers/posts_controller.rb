class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :post_params, only: [:create, :update]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @comments = Comment.where(post_id: @post.id)
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
   @post.update(post_params)

   if @post.save
     redirect_to @post, notice: "変更が保存されました"
   else
     # 失敗した場合editに戻る
     render :edit
   end
 end

 def destroy
   @post.destroy
   redirect_to posts_path
 end

 private

 def set_post
   @post = Post.find(params[:id])
 end

 def post_params
    params.require(:post).permit(:title, :image, :contents, :user_id)
 end

 def correct_user
   @post = Post.find(params[:id])
   user_id = @post.user_id
   if user_id != current_user.id
     redirect_to root_path, alert: '許可されていないページです'
   end
 end
end
