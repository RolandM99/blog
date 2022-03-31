class CommentsController < ApplicationController
  def new
    @add_new_comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @add_new_comment = @post.comments.create(
      text: comment_params[:text],
      author_id: current_user.id,
      post_id: @post.id
    )
    @add_new_comment.author_id = @post.id
    @add_new_comment.post_id = params[:post_id]
    @add_new_comment.update_comments_counter

    if @add_new_comment.save
      flash[:notice] = 'Created successfully'
    else
      flash.now[:error] = 'Comment failed'
    end
    redirect_to "/users/#{@post.author_id}/posts/#{@post.id}"
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
