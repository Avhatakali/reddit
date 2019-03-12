class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @user = current_user
    @comment = @user.comments.create(comment_params)

    if @comment.save
      redirect_to posts_path(@post)
    else
      render 'new'
    end
  end

  def like
    @comment = Comment.find(params[:comment_id])
    user = @comment.user

    if current_user != user
      @comment.like += 1
      @comment.vote = @comment.like + @comment.dislike
      @comment.save
    else
      redirect_to posts_path, alert: "Access Denied, yuh cannot like your own comment"
    end
  end

  def dislike
    @comment = Comment.find(params[:comment_id])
    user = @comment.user

    if current_user != user
      @comment.dislike += 1
      @comment.vote = @comment.like + @comment.dislike
      @comment.save
    else
      redirect_to posts_path, alert: "Access Denied, yuh cannot dislike your own comment"
    end
  end

  private
    def comment_params
      params.require(:comment)
           .permit(:comment, :user_id)
           .merge(post_id: params[:post_id])
    end
end
