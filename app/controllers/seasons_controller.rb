class SeasonsController < ApplicationController
  # before_action :authenticate_user!

  def index
  end

  private
  def seasons_params
    params.require(:seasons).permit(:title, :content)
  end
end
