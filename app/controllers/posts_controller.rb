class PostsController < ApplicationController
  def index
    @posts = Post.order(vote: :desc)
    @post_paginator = Post.order(:name).page params[:page]
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
   @post = current_user.posts.create(post_params)

    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])

    user = @post.user
    if current_user == user
      @post.destroy
      redirect_to posts_path
    else
      redirect_to posts_path, alert: "Access Denied, yuh cannot delete another user's post"
    end
  end


  def like
    @user = current_user
    @post = Post.find(params[:post_id])
    @post.like += 1
    @post.vote = @post.like - @post.dislike
    @post.save
  end

  def dislike
    @user = current_user
    @post = Post.find(params[:post_id])
    @post.dislike += 1
    @post.vote = @post.like - @post.dislike
    @post.save
  end

  private
    def post_params
      params.require(:post).permit(:weblink, :title, :description)
    end
end
