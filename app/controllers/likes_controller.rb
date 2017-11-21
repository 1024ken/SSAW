class LikesController < ApplicationController
  before_action :set_variables

  def like
    like = @warmspring.likes.build(user_id: current_user.id)
    like.save
  end

  def unlike
    like = @warmspring.likes.find_by(user_id: current_user.id)
    like.destroy
  end

  private
  def set_variables
    @warmspring = Warmspring.find(params[:warmspring_id])
    @id_name = "like-link-#{@warmspring.id}"
    @id_star = "star-#{@warmspring.id}"
  end
end
