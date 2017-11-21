class AutumnCommentsController < ApplicationController
  def create
    @comment = current_user.autumn_comments.build(comment_params)
    @summer = @comment.autumn
    respond_to do |format|
      if @comment.save
        format.html { redirect_to autumn_path(@autumn), notice: 'コメントを投稿しました!' }
        format.js {render :index}
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @autumn_comment = AutumnComment.find(params[:id])
    @autumn = @autumn_comment.autumn
  end

  def update
    @autumn_comment = AutumnComment.find(params[:id])
    respond_to do |format|
      if @autumn_comment.update(comment_params)
        format.html {redirect_to autumn_index_path, notice: "コメントを更新しました！"}
        format.js {render :index}
      else
        format.html {render :index}
      end
    end
  end

  def destroy
    @comment = AutumnComment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js {render :index}
    end
  end

  private
  def comment_params
    params.require(:autumn_comment).permit(:autumn_id, :content)
  end
end
