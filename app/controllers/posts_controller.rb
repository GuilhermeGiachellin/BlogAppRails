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
    @post.comments_counter = 0;
    @post.likes_counter = 0;
    if @post.save
      flash[:notice] = 'Post created'      
      redirect_to user_post_path(current_user, @post)      
    else
      flash[:notice] = 'Post not created'
      redirect_to user_post_path(current_user, @post)  
    end    
  end

  def like
    @post = Post.all.find(params[:id])
    @user = User.find(params[:user_id])
    @like = Like.create(author_id: current_user.id, post_id: @post.id)    
    if @like.save
      flash[:notice] = 'Post liked'      
      redirect_to user_post_path(@user, @post)    
    else
      flash[:notice] = "Couldn't like"
      redirect_to user_post_path(@user, @post) 
    end  
  end
end
