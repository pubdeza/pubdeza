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
  end

  def destroy
  end

  private

  def comment_params
    params.permit(:post_id, :contents)
  end
end
