class UserTeamController < ApplicationController
  def update
    @user_team = UserTeam.find(params[:id])
    @user_team.update(user_team_params)
    redirect_to terrain_match_path(@user_team.match.terrain, @user_team.match)
  end

  def create
    @user_team = UserTeam.new
    @user_team.user = current_user
    @team = Team.find(params[:team_id].to_i)
    @user_team.team = @team
    @user_team.position = params[:position]
    @user_team.save!
    # redirect_to terrain_match_path(@match.terrain, @match)
  end

  private

  def user_team_params
    params.require(:user_team).permit(:position, :user_id, :team_id)
  end
end
