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

  private
   def comment_params
     params.require(:comment)
           .permit(:comment, :user_id)
           .merge(post_id: params[:post_id])
   end
end
