class CommentsController < ApplicationController
  def index
    @comment_topics = current_user.comment_topics
  end

  def create
    comment = Comment.new
    comment.user_id = current_user.id
    comment.topic_id = params[:topic_id]

    if comment.save
      redirect_to topics_path, success: 'コメントを登録しました'
    else
      redirect_to topics_path, danger: 'コメントを登録に失敗しました'
    end
  end
end
