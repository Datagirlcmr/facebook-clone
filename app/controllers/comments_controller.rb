class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    post = Post.find_by(id: params[:comment][:post_id]) 
    comment = post.comments.build(author_id: current_user.id,
                                  content: params[:comment][:content])
    if comment.save
      redirect_to posts_path
    else
      render posts_path
    end
  end

  def destroy
  end
end
