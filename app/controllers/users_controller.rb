





class UsersController < ApplicationController
    def show
      id = params[:id]
      @user = User.find(params[:id])
      @matches = Match.where(user_id: id)
      @teams = @user.teams
      


    end
end