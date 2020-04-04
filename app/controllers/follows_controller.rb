class FollowsController < ApplicationController
  def new
    @follow = Follow.new
    @follow.follower_id = current_user.id
    @follow.followed_user_id = params[:user_id]
    authorize @follow
    @follow.save

    redirect_to user_path(params[:user_id])
  end

  def destroy
    @follow = Follow.find_by(follower_id: current_user.id, followed_user_id: params[:id]) 
    authorize @follow
    @follow.destroy
    
    redirect_to user_path(params[:id])
  end
end
