class CommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new((params.require(:comment).permit(:text)))
    @comment.post = @post
    @comment.author = current_user
    flash[:notice] = if @comment.save
                       'Comment created'
                     else
                       'Comment not created'
                     end
    redirect_to user_post_path(@user, @post)
  end
end
