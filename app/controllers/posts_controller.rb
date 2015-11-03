class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def show
    # @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      render 'edit'
  end
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
    def set_post
      @post = Post.find(params[:id])
    end

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :id)
  end
end
