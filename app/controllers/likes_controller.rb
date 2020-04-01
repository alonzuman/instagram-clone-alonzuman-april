class LikesController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @user = current_user
    @like = Like.new
    @like.post = @post
    @like.user = @user
    @like.save

    redirect_to post_path(@post)
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to root_path
  end
end
