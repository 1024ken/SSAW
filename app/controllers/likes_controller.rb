class LikesController < ApplicationController
  before_action :set_variables

  def like
    like = @season.likes.build(user_id: current_user.id)
    like.save
  end

  def unlike
    like = @season.likes.find_by(user_id: current_user.id)
    like.destroy
  end

  private
  def set_variables
    @season = Object.const_get(params[:season_name]).find(params[:season_id])
    # @season = Warmspring.find(params[:warmspring_id])
    @id_name = "like-link-#{@season.id}"
    @id_star = "star-#{@season.id}"
  end
end
