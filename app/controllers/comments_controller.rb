class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(@post), notice: "コメントしました"
    else
      render :new
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user_id
      @comment.update(comment_params)
      @post = @comment.post_id
    end
    if @comment.save
      redirect_to post_path(@post), notice: "コメントを編集しました"
    else
      render :show
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user_id
      @post = @comment.post_id
      @comment.destroy
      redirect_to post_path(@post), notice: "コメントを削除しました"
    end
  end

  private

  def comment_params
    params.permit(:post_id, :comment_id, :contents)
  end
end
