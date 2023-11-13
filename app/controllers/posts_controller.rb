class PostsController < ApplicationController
  before_action :require_signin, only: [:new,:create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,:body,:user_id)
  end

  def require_signin
  end
end
