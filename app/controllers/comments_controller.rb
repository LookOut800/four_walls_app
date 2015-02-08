class CommentsController < ApplicationController

  def index
  end

  def new
  end

def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def article_params
    params.require(:post).permit(:title, :body, :image)
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
