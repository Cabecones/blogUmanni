class CommentsController < ApplicationController
  before_action :set_post, only: [:create]
  before_action :authenticate_user!, only: [:create]
  def create
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
