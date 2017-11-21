# class CommentsController < ApplicationController
#   def create
#     @comment = current_user.comments.build(comment_params)
#     @warmspring = @comment.warmspring
#     respond_to do |format|
#       if @comment.save
#         format.html { redirect_to warmspring_path(@warmspring), notice: 'コメントを投稿しました!' }
#         format.js {render :index}
#       else
#         format.html { render :new }
#       end
#     end
#   end

#   def edit
#     @comment = Comment.find(params[:id])
#     @warmspring = @comment.warmspring
#   end

#   def update
#     @comment = Comment.find(params[:id])
#     respond_to do |format|
#       if @comment.update(comment_params)
#         format.html {redirect_to warmspring_index_path, notice: "コメントを更新しました！"}
#         format.js {render :index}
#       else
#         format.html {render :index}
#       end
#     end
#   end

#   def destroy
#     @comment = Comment.find(params[:id])
#     @comment.destroy
#     respond_to do |format|
#       format.js {render :index}
#     end
#   end
#   private
#   def comment_params
#     params.require(:comment).permit(:warmspring_id, :content)
#   end
# end
