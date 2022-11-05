class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      redirect_to request.referer, notice: 'Comentário realizado com sucesso!'
    else
      redirect_to request.referer, alert: 'Erro ao realizar comentário! Tente novamente mais tarde.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
