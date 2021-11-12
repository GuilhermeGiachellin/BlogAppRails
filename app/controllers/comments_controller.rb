class CommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new((params.require(:comment).permit(:text)))
    @comment.post = @post
    @comment.author = current_user
    if @comment.save
      flash[:notice] = 'Comment created'
      redirect_to user_post_path(@user, @post)      
    else
      flash[:notice] = 'Comment not created'
      redirect_to user_post_path(@user, @post)  
    end
  end
end
