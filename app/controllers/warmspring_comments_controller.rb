class WarmspringCommentsController < ApplicationController
  def create
    @comment = current_user.warmspring_comments.build(comment_params)
    @warmspring = @comment.warmspring
    respond_to do |format|
      if @comment.save
        format.html { redirect_to warmspring_path(@warmspring), notice: 'コメントを投稿しました!' }
        format.js {render :index}
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @warmspring_comment = WarmspringComment.find(params[:id])
    @warmspring = @warmspring_comment.warmspring
  end

  def update
    @warmspring_comment = WarmspringComment.find(params[:id])
    respond_to do |format|
      if @warmspring_comment.update(comment_params)
        format.html {redirect_to warmspring_index_path, notice: "コメントを更新しました！"}
        format.js {render :index}
      else
        format.html {render :index}
      end
    end
  end

  def destroy
    @comment = WarmspringComment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js {render :index}
    end
  end

  private
  def comment_params
    params.require(:warmspring_comment).permit(:warmspring_id, :content)
  end
end
