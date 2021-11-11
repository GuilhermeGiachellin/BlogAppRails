class CommentsController < ApplicationController
    def create
        @user = User.find(params[:user_id])
        @post = Post.find(params[:post_id])    
        @comment = Comment.new((params.require(:comment).permit(:text)))   
        @comment.post = @post
        @comment.author = @user   
        if @comment.save
            redirect_to user_post_path(current_user, @post)
        end
     end
end