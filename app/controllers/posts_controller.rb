class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @user = current_user
  end

  def create
    @post = current_user.posts.new(params.require(:post).permit(:title, :text))
    @post.comments_counter = 0
    @post.likes_counter = 0
    flash[:notice] = if @post.save
                       'Post created'
                     else
                       'Post not created'
                     end
    redirect_to user_post_path(current_user, @post)
  end
end
