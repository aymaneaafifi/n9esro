



class MatchesController < ApplicationController
  # before action
  before_action :match_params
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
  end
  def create
    @match = Match.new(match_params)
    @match.user = current_user
    if @macth.save!
      redirect_to match_path(@match)
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
    params.require(:match).permit(:title,:description,:date,:terrain_id)
  end
  # find match in db using :id
  def set_match
    @match = Match.find(params[:id])
  end

end
