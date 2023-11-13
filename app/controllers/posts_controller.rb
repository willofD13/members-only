class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:title], body: params[:body])

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
