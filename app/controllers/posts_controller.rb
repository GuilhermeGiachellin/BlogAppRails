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
    redirect_to user_post_path(current_user, @post) if @post.save
  end

  def like
    @post = Post.all.find(params[:id])
    @user = User.find(params[:user_id])
    @like = Like.create(author_id: @user.id, post_id: @post.id)
    redirect_to user_post_path(@user, @post)
  end
end
