class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def edit

  end
  def create
    @post = current_user.posts.build(post_params) if logged_in?
    if @post.save
      redirect_to root_path
    else
      render new
  end
end

private

def post_params
  params.require(:post).permit(:title, :body, :user_id)
end
end
