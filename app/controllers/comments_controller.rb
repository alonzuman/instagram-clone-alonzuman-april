class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.user = current_user
    @comment.post = @post
    @comment.save ? (redirect_to post_path(@post)) : (render :new)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
