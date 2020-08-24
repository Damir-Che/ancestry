class CommentsController < ApplicationController


  before_action :set_comment, only: [:create, :destroy]

  def create

    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end


  private

  def comment_params
    params.require(:comment).permit(:name,:body)

  end


  def set_comment
    @post = Post.find(params[:post_id])
  end

end
