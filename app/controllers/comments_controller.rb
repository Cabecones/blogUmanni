class CommentsController < ApplicationController
  # usuario autenticado pode criar um comentário em um post existente de qualquer pessoa
  # comentarios sao criados com o id do usuario autenticado e vinculado a um post
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

