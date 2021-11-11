class CommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new((params.require(:comment).permit(:text)))
    @comment.post = @post
    @comment.author = @user
    redirect_to user_post_path(@user, @post) if @comment.save
  end
end
