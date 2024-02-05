



class MatchesController < ApplicationController
  # before action
  # before_action :match_params
  before_action :set_match, only: %i[show edit]

  # index
  def index
    @matches = Match.all
  end
  # show
  def show
    # ...
  end
  # new
  def new
    @match = Match.new
    @match.date = Time.current + 1.day
    @terrains = Terrain.all
    @terrainAddress = @terrains.map do |terrain|
      terrain.address
    end

      @terrainNames = @terrains.map do |terrain|
        terrain.name
      end
  end

  def create


    @match = Match.new(match_params)
    @match.user = current_user
    @match.address = params[:address]
    @terrain = Terrain.find_by(name: params[:terrain], address: params[:address])
    @match.terrain = @terrain


    if @match.save!
      redirect_to matches_path(@match)
    else
      render :new, status: :unprocessable_entity
    end
  end
  # update
  def edit
    # ...
  end
  def update
    if @match.update(match_params)
      redirect_to match, notice: 'match was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  # destroy
  def destroy
    @match.destroy
    redirect_to article_path(@match), notice: 'match was successfully destroyed.'
  end





  private

  # match params
  def match_params
    params.require(:match).permit(:title, :description, :date)
  end
  # find match in db using :id
  def set_match
    @match = Match.find(params[:id])
  end

end
