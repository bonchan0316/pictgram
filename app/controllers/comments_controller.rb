class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]

    p "77777777777777777777777777777777777777777"
    p @comment

  end

  def create
    @comment = current_user.comments.new(comment_params)

    p "mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm"
    p @comment

    if @comment.save
      redirect_to topics_path, success: 'コメントを登録しました'
    else
      flash.now[:danger] = 'コメントを登録に失敗しました'
      render :new
    end
  end

  private
  def comment_params
    p "#############################"
    p params
    params.require(:comment).permit(:body)
  end
end
