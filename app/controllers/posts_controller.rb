class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path
    else
      render :update, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      redirect_to root_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,:body,:user_id)
  end

end
