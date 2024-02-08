
class TerrainsController < ApplicationController
  # before action
  # before_action :terrain_params
  before_action :set_terrain, only: %i[show]

  # index
  def index
    @terrains = Terrain.all
  end
  # show
  def show
    # ...
  end
  # new
  def new
    @terrain = Terrain.new
  end
  def create
    @terrain = Terrain.new(match_params)
    @terrain.user = current_user
    if @terrain.save!
      redirect_to match_path(@terrain)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # match params
  def terrain_params
    params.require(:terrain).permit(:name,:address,:price)
  end
  # find match in db using :id
  def set_terrain
    @terrain = Terrain.find(params[:id])
  end

end
