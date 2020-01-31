class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.posts
    current_user.friends.each { |friend| @posts = @posts.or(friend.posts) }
    @posts = @posts.order(created_at: :desc)
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def show; end

  def create
    post = current_user.posts.build(post_params)
    if post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
