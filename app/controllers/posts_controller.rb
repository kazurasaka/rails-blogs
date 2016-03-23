class PostsController < ApplicationController
  def index
    @post = Post.joins(:user).merge(Post.order(updated_at: :desc)).all
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
    @post = Post.joins(:user).where(id: params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :image)
  end
end
