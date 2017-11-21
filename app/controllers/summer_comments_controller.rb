class SummerCommentsController < ApplicationController
  def create
    @comment = current_user.summer_comments.build(comment_params)
    @summer = @comment.summer
    respond_to do |format|
      if @comment.save
        format.html { redirect_to summer_path(@summer), notice: 'コメントを投稿しました!' }
        format.js {render :index}
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @summer_comment = SummerComment.find(params[:id])
    @summer = @summer_comment.summer
  end

  def update
    @summer_comment = SummerComment.find(params[:id])
    respond_to do |format|
      if @summer_comment.update(comment_params)
        format.html {redirect_to summer_index_path, notice: "コメントを更新しました！"}
        format.js {render :index}
      else
        format.html {render :index}
      end
    end
  end

  def destroy
    @comment = SummerComment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js {render :index}
    end
  end

  private
  def comment_params
    params.require(:summer_comment).permit(:summer_id, :content)
  end
end
