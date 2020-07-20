class RelationshipsController < ApplicationController
  before_action :logged_in_user
  before_action :find_micropost , only: :destroy
  def create
    user = User.find_by(followed_id: params[:followed_id])
    current_user.follow(user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    user.followed
    current_user.unfollow(user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  private

  def find_micropost
    micropost = Relationship.find_by(id: params[:id]
    return if micropost
    flash[:warming] = "micropost not found"
    redirect_to root_path
    end
  end
end
