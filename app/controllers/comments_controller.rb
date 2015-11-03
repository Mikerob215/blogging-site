class CommentsController < ApplicationController
  
  def create
    @parent = Post.find(params[:post_id]) if params[:post_id]
    @parent = Comment.find(params[:comment_id]) if params[:comment_id]
    @comment = @parent.comments.new(comment_params)
    # @comment.user_id = current_user.id if current_user
    if @comment.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    @parent_comment = Comment.find(params[:comment_id])
    @comment = @parent_comment.comments.new
  end
  private
  def comment_params
    params.require(:comment).permit(:body, :commenter, :title, :comment_id, :post_id, :user_id, :commentable_type, :commentable_id)
  end

end
