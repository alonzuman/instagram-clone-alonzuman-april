class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  def index
    @posts = policy_scope(Post).order(created_at: :desc)
  end

  def show
    authorize @post
  end

  def new
    @post = Post.new
    authorize @post
  end
  
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post

    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description, :photo)
  end
end
