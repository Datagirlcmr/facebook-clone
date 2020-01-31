class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  def index
    @friendship_requests = current_user.requests
    @friends = current_user.friends
  end

  def create
    friendship = current_user.friendships.create(friend_id: params[:friend_id], status: false)
    redirect_to users_path
  end

  def update
    friendship = Friendship.find_by(id: params[:id])
    if friendship
      friendship.update_attributes(:status => true)
    end
    redirect_to friendships_path
  end
end
