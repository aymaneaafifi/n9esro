





class UsersController < ApplicationController
    def show
      # users connected
      users_online = Kredis.unique_list "users_online"
      @users = User.find(users_online.elements)
      

      #
      id = params[:id]
      @user = User.find(params[:id])
      @matches = Match.where(user_id: id)
      @teams = @user.teams
      @online = user_signed_in?


    end

end
