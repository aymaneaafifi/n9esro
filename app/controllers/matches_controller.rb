
class MatchesController < ApplicationController
  # before action
  # before_action :match_params
  before_action :set_match, only: %i[show edit]
  before_action :terrainNamesAddresses, only: %i[create new]

  # index
  def index
    @matches = Match.all
  end
  # show
  def show
    @team1 = @match.team1
    @team2 = @match.team2
    
  end
  # new
  def new
    @match = Match.new
    @match.date = Time.current + 1.day
  end

  def create
    puts "Params: #{params.inspect}"
    @match = Match.new(match_params)
    @match.user = current_user
    @match.address = params[:address]
    @terrain = Terrain.find_by(name: params[:terrain], address: params[:address])
    @match.terrain = @terrain
    if @terrain && @match.save
      # team_title = params[:match][:team]
      # puts "Team Title: #{team_title}"
      # team = @match.send(team_title)
      # unless team.users.include?(current_user)
      #   user_team = UserTeam.new(user: current_user ,team: team, position: params[:match][:position])
      #   if user_team.save
      #     team.user_teams << user_team
      #   else
      #     puts user_team.errors.full_messages
      #   end
      # end
      redirect_to terrain_match_path(@terrain, @match), notice: 'Match was successfully created.'
    else
      flash[:error] = "Failed to create the match"
      render :new, status: :unprocessable_entity
    end

  end
  # update
  def edit
    # ...
  end

  def join_team
    @match = Match.find(params[:id])
    position = params[:position]
    team = position == 'team1' ? @match.team1 : @match.team2
    team.users << current_user unless team.users.include?(current_user)
    render json: { success: true }
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
  def terrainNamesAddresses
    @terrains = Terrain.all
    @terrainAddress = @terrains.map do |terrain|
      terrain.address
    end
    @terrainNames = @terrains.map do |terrain|
      terrain.name
    end
  end

end
