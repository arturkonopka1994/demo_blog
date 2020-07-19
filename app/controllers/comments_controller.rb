class CommentsController < ApplicationController
  before_action :find_post, only: [:new, :create, :destroy]
  before_action :find_comment, only: [:destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.save
    redirect_to post_path(@post)
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@comment.post)
  end

  private
  
  def find_post
    @post = Post.find(params[:post_id])
  end 
  
  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:name, :comment)
  end
end
