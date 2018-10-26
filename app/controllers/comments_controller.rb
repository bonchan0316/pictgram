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
      redirect_to topics_path, danger: 'コメントを登録に失敗しました'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:topic_id, :body)
  end
end
