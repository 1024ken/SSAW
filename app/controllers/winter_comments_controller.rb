class WinterCommentsController < ApplicationController
  def create
    @comment = current_user.winter_comments.build(comment_params)
    @winter = @comment.winter
    respond_to do |format|
      if @comment.save
        format.html { redirect_to winter_path(@winter), notice: 'コメントを投稿しました!' }
        format.js {render :index}
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @winter_comment = WinterComment.find(params[:id])
    @winter = @winter_comment.winter
  end

  def update
    @winter_comment = WinterComment.find(params[:id])
    respond_to do |format|
      if @winter_comment.update(comment_params)
        format.html {redirect_to winter_index_path, notice: "コメントを更新しました！"}
        format.js {render :index}
      else
        format.html {render :index}
      end
    end
  end

  def destroy
    @comment = WinterComment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js {render :index}
    end
  end

  private
  def comment_params
    params.require(:winter_comment).permit(:winter_id, :content)
  end
end
