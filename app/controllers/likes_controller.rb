class LikesController < ApplicationController
  def new; end

  def create
    post = Post.find_by(id: params[:post_id])
    like = post.likes.find_by(author_id: current_user.id)
    if like
      like.destroy
    else
      post.likes.create(author_id: current_user.id)
    end
    redirect_to posts_path
  end

  def destroy; end
end
