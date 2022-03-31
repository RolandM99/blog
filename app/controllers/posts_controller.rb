class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    # @user = @post.author
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @new_post = @user.posts.new(post_params)
    respond_to do |myform|
      myform.html do
        if @new_post.save
          redirect_to "/users/#{@new_post.author.id}/posts/"
        else
          render :new, alert: 'Post failed to create'
        end
      end
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
