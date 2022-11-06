class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :check_user, only: %i[edit update destroy]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:notice] = 'Postagem criada com sucesso!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Postagem atualizada com sucesso!'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Postagem excluída com sucesso!'
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def check_user
    if current_user != @post.user
      flash[:alert] = 'Você não tem permissão para editar ou excluir esta postagem!'
      redirect_to root_path
    end
  end
end
