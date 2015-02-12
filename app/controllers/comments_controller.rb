class CommentsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      redirect_to post_path(@comment.post_id)
    else
      flash[:error] = "Comment can't be blank"
      redirect_to post_path(@comment.post_id)
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post_id)
    else
      flash[:error] = "Comment can't be blank"
      redirect_to post_path(@comment.post_id)
    end
  end

  def destroy
    post = @comment.post
    @comment.destroy
    redirect_to post_path(post.id)
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
