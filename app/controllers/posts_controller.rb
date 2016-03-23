class PostsController < ApplicationController
  def index
    @post = Post.joins(:users, :comments).all
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :image)
  end
end
