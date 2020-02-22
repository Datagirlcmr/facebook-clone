class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  def index
    @friendship_requests = current_user.received_requests
    @friends = current_user.friends
  end

  def create
    current_user.friendships.create(friend_id: params[:friend_id], status: false)
    redirect_to users_path
  end

  def update
    friendship = Friendship.find_by(id: params[:id])
    friendship&.update_attribute(:status, true)
    current_user.friendships.create(friend: friendship.user, status: true)
    redirect_to friendships_path
  end
end
