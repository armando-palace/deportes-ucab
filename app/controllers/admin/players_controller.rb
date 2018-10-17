class Admin::PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to admin_players_path
    else
      render "new"
    end
  end

  def index
    @players = Player.all
  end

  private

    def player_params
      params.require(:player).permit(
        :id_card, :first_name, :middle_name, :last_name,
        :school_id, :period_id, :team_id, :user_id
      )
    end
end