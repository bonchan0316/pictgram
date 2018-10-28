class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]

  end

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to topics_path, success: 'コメントを登録しました'
    else
      flash.now[:danger] = 'コメントを登録に失敗しました'
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :topic_id)
  end
end
