class LikesController < ApplicationController
  def new
    @like = Like.new
    @like.post = Post.find(params[:post_id])
    @like.user = current_user
    authorize @like

    @like.save

    redirect_to post_path(@like.post)
  end

  def destroy
    @like = Like.find(params[:id])
    authorize @like
    @like.destroy
    redirect_to root_path
  end
end
