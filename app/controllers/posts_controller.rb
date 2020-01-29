class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
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
